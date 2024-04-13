part of 'one_medicine_cubit.dart';

abstract class OneMedicineState {}

final class OneMedicineInitial extends OneMedicineState {}

class OneMedicineLoading extends OneMedicineState {}

class OneMedicineSuccess extends OneMedicineState {
  final Medicines oneMedicine;
  OneMedicineSuccess(this.oneMedicine);
}

class OneMedicineError extends OneMedicineState {
  final String errorMessage;
  OneMedicineError(this.errorMessage);
}
