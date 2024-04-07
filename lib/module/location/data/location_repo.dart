import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pill_reminder/module/location/logic/services/location_service.dart';
import 'package:pill_reminder/module/location/logic/services/map_controller.dart';

import '../../../core/error/failure.dart';

abstract class LocationRepo {
  Future<Either<Failures, void>> getRealTimeLocation();
  Future<Either<Failures, void>> getMyCurrentLocation();
  Future<Either<Failures, void>> checkAndRequestLocationPermission();
  Either<Failures, void> setMapController(GoogleMapController mapController);
}

class LocationRepoImpl extends LocationRepo {
  LocationService locationService;
  MapController mapController;

  LocationRepoImpl(
      {required this.locationService, required this.mapController});

  @override
  Either<Failures, void> setMapController(GoogleMapController mapController) {
    try {
      this.mapController.setMapController = mapController;
      return const Right(null);
    } catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> getRealTimeLocation() async {
    try {
      locationService.getRealTimeLocation(
        (locationData) {
          locationService.locationData = locationData;
          mapController.changeCameraPosition(
            lat: locationData.latitude!,
            long: locationData.longitude!,
          );
        },
      );

      return const Right(null);
    } on LocationServiceException catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    } on LocationPermissionException catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    } catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> checkAndRequestLocationPermission() async {
    try {
      locationService.checkAndRequestLocationPermission();
      return const Right(null);
    } on LocationServiceException catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    } on LocationPermissionException catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    } catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> getMyCurrentLocation() async {
    try {
      await locationService.checkLocationServiceAndPermission();
      mapController.changeCameraPosition(
          lat: locationService.locationData.latitude!,
          long: locationService.locationData.longitude!);
      return const Right(null);
    } on LocationServiceException catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    } on LocationPermissionException catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    } catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }
}
