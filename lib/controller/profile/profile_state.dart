part of 'profile_cubit.dart';

abstract class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class GetPersonalDataLoadingState extends ProfileState {}

final class GetPersonalDataSuccessState extends ProfileState {
  final PersonalDataModel personalDataModel;
  GetPersonalDataSuccessState({required this.personalDataModel});
}

final class GetPersonalDataErrorState extends ProfileState {
  final String errorMessage;
  GetPersonalDataErrorState({required this.errorMessage});
}
