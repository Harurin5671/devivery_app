import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:delivery/domain/domain.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationService locationService;
  LocationBloc(this.locationService) : super(LocationInitial()) {
    on<CheckLocationStatusEvent>(_onCheckStatus);
    on<RequestLocationPermissionEvent>(_onRequestPermission);
    on<StartLocationTrackingEvent>(_onStartTracking);
    on<StopLocationTrackingEvent>(_onStopTracking);
  }

  Stream<LocationData>? _locationStream;
  StreamSubscription<LocationData>? _subscription;

  Future<void> _onCheckStatus(
    CheckLocationStatusEvent event,
    Emitter<LocationState> emit,
  ) async {
    print('State: $state');
    emit(LocationLoading());
    final serviceEnabled = await locationService.isLocationServiceEnabled();
    if (!serviceEnabled) {
      emit(LocationServiceDisabled());
      print(1);
      return;
    }

    final permission = await locationService.checkPermission();
    print('permission: $permission');
    if (permission == LocationPermissionStatus.denied) {
      add(RequestLocationPermissionEvent());
      print(2);
      return;
    }

    if (permission == LocationPermissionStatus.permanentlyDenied) {
      emit(LocationPermissionPermanentlyDenied());
      print(3);
      return;
    }

    if (permission == LocationPermissionStatus.granted) {
      final location = await locationService.getCurrentLocation();
      await _emitLocationUpdate(emit: emit, location: location);
    }
  }

  Future<void> _onRequestPermission(
    RequestLocationPermissionEvent event,
    Emitter<LocationState> emit,
  ) async {
    final status = await locationService.requestPermission();
    if (status == LocationPermissionStatus.granted) {
      final location = await locationService.getCurrentLocation();
      await _emitLocationUpdate(emit: emit, location: location);
    }
    if (status == LocationPermissionStatus.denied) {
      emit(LocationPermissionDenied());
    }

    if (status == LocationPermissionStatus.permanentlyDenied) {
      emit(LocationPermissionPermanentlyDenied());
    }
  }

  Future<void> _onStartTracking(
    StartLocationTrackingEvent event,
    Emitter<LocationState> emit,
  ) async {
    await _subscription?.cancel();
    _locationStream = locationService.watchLocation();

    _subscription = _locationStream?.listen((location) async {
      await _emitLocationUpdate(emit: emit, location: location);
    });
  }

  Future<void> _onStopTracking(
    StopLocationTrackingEvent event,
    Emitter<LocationState> emit,
  ) async {
    await _subscription?.cancel();
    _subscription = null;
  }

  Future<void> _emitLocationUpdate({
    required Emitter<LocationState> emit,
    required LocationData location,
  }) async {
    try {
      final address = await locationService.getAddressFromCoordinates(
        location.latitude,
        location.longitude,
      );
      emit(
        LocationLoaded(
          latitude: location.latitude,
          longitude: location.longitude,
          address: address,
        ),
      );
    } catch (e) {
      emit(LocationError('Error retrieving location'));
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
