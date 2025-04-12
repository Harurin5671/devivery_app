import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:delivery/domain/domain.dart';

class GeolocatorService implements LocationService {
  @override
  Future<LocationPermissionStatus> checkPermission() async {
    final status = await Permission.location.status;
    return _mapPermission(status);
  }

  @override
  Future<String> getAddressFromCoordinates(double lat, double lng) async {
    final placemarks = await placemarkFromCoordinates(lat, lng);
    final place = placemarks.first;
    return '${place.street}';
  }

  @override
  Future<LocationData> getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition();
    return LocationData(
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }

  @override
  Future<bool> isLocationServiceEnabled() {
    return Geolocator.isLocationServiceEnabled();
  }

  @override
  Future<LocationPermissionStatus> requestPermission() async {
    final status = await Permission.location.request();

    return _mapPermission(status);
  }

  @override
  Stream<LocationData> watchLocation() {
    return Geolocator.getPositionStream().map(
      (pos) => LocationData(latitude: pos.latitude, longitude: pos.longitude),
    );
  }

  LocationPermissionStatus _mapPermission(PermissionStatus status) {
    switch (status) {
      case PermissionStatus.granted:
        return LocationPermissionStatus.granted;
      case PermissionStatus.denied:
        return LocationPermissionStatus.denied;
      case PermissionStatus.permanentlyDenied:
        return LocationPermissionStatus.permanentlyDenied;
      default:
        return LocationPermissionStatus.denied;
    }
  }
}
