import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController {
  GoogleMapController? _mapController;

  set setMapController(GoogleMapController mapController) =>
      _mapController = mapController;

  void changeMapStyle(String style) {
    _mapController!.setMapStyle(style);
  }

  void changeCameraPosition({required double lat, required double long}) {
    _mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(lat, long),
          zoom: 17,
        ),
      ),
    );
  }
}
