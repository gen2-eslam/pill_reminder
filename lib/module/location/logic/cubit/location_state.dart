part of 'location_cubit.dart';

abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationSuccess extends LocationState {}

class LocationFailure extends LocationState {
  final String message;
  LocationFailure({required this.message});
}
