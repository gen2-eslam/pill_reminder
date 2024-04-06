part of 'add_medicien_cubit.dart';

abstract class AddMedicienState {}

final class MedicienInitial extends AddMedicienState {}

// MedicienLoading
final class MedicienLoading extends AddMedicienState {}

final class MedicienError extends AddMedicienState {
  final String error;
  MedicienError(this.error);
}

final class MedicienAddSuccess extends AddMedicienState {
  final String message;
  MedicienAddSuccess(this.message);
}

final class AddImageError extends AddMedicienState {
  final String error;
  AddImageError(this.error);
}

final class AddImageSucess extends AddMedicienState {}
