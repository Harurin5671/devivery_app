enum LocationPermissionStatus { granted, denied, permanentlyDenied }

class LocationData {
  final double latitude;
  final double longitude;

  const LocationData({required this.latitude, required this.longitude});
}

abstract class LocationService {
  Future<LocationPermissionStatus> requestPermission();
  Future<LocationPermissionStatus> checkPermission();
  Future<bool> isLocationServiceEnabled();
  Future<LocationData> getCurrentLocation();
  Stream<LocationData> watchLocation();
  Future<String> getAddressFromCoordinates(double lat, double lng);
}
