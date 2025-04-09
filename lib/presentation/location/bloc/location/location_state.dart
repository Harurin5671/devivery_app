part of 'location_bloc.dart';

sealed class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object?> get props => [];
}

final class LocationInitial extends LocationState {}

final class LocationLoading extends LocationState {}

final class LocationLoaded extends LocationState {
  final double latitude;
  final double longitude;
  final String address;

  const LocationLoaded({
    required this.latitude,
    required this.longitude,
    required this.address,
  });

  @override
  List<Object?> get props => [latitude, longitude, address];
}

final class LocationPermissionDenied extends LocationState {}

final class LocationPermissionPermanentlyDenied extends LocationState {}

final class LocationServiceDisabled extends LocationState {}

final class LocationPermissionGranted extends LocationState {}

final class LocationError extends LocationState {
  final String message;
  const LocationError(this.message);

  @override
  List<Object?> get props => [message];
}
