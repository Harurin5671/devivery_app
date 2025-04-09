part of 'location_bloc.dart';

sealed class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object?> get props => [];
}

final class CheckLocationStatusEvent extends LocationEvent {}

final class RequestLocationPermissionEvent extends LocationEvent {}

final class GetLocationEvent extends LocationEvent {}

final class StartLocationTrackingEvent extends LocationEvent {}

final class StopLocationTrackingEvent extends LocationEvent {}
