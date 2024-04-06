part of 'medicien_cubit.dart';

abstract class EditMedicienState {}

final class MedicienInitial extends EditMedicienState {}

// MedicienLoading
final class MedicienLoading extends EditMedicienState {}

final class MedicienError extends EditMedicienState {
  final String error;
  MedicienError(this.error);
}

final class MedicienAddSuccess extends EditMedicienState {
  final String message;
  MedicienAddSuccess(this.message);
}

final class AddImageError extends EditMedicienState {
  final String error;
  AddImageError(this.error);
}

final class AddImageSucess extends EditMedicienState {}
