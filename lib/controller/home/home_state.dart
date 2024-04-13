part of 'home_cubit.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}

class MedicinesLoading extends HomeState {}

class MedicinesError extends HomeState {
  final String errorMessage; // error message

  MedicinesError(this.errorMessage);
}


class MedicinesSuccess extends HomeState {
  final MedicinesModel medicinesModel;

  MedicinesSuccess(this.medicinesModel);
}
//editMedicines

