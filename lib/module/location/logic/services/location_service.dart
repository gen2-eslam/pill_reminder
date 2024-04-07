import 'package:location/location.dart';

class LocationService {
  final Location _location = Location();
  late LocationData locationData;
  LocationService() {
    _location.changeSettings(
      distanceFilter: 2,
      accuracy: LocationAccuracy.navigation,
    );
  }
  Future<void> checkLocationServiceAndPermission() async {
    await checkAndRequestLocationService();
    await checkAndRequestLocationPermission();
  }

  Future<void> checkAndRequestLocationService() async {
    bool isServiceEnabled = await _location.serviceEnabled();
    if (!isServiceEnabled) {
      isServiceEnabled = await _location.requestService();
      if ((!isServiceEnabled)) {
        throw LocationServiceException();
      }
    }
  }

  Future<void> checkAndRequestLocationPermission() async {
    PermissionStatus permissionStatus = await _location.hasPermission();
    if (permissionStatus == PermissionStatus.deniedForever) {
      throw LocationPermissionException();
    }
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await _location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        throw LocationPermissionException();
      }
    }
  }

  Future<void> getLocation() async {
    await checkLocationServiceAndPermission();
    locationData = await _location.getLocation();
  }

  void getRealTimeLocation(void Function(LocationData)? onData) async {
    await checkLocationServiceAndPermission();

    _location.onLocationChanged.listen(onData);
  }
}

class LocationServiceException implements Exception {
 
}

class LocationPermissionException implements Exception {

}
