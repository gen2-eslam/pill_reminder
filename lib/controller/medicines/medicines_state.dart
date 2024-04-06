part of 'medicines_cubit.dart';

abstract class MedicinesState {}

final class MedicinesInitial extends MedicinesState {}

class MedicinesLoading extends MedicinesState {}

class MedicinesError extends MedicinesState {
  final String errorMessage; // error message

  MedicinesError(this.errorMessage);
}

class MedicinesEditSuccess extends MedicinesState {
  String message;

  MedicinesEditSuccess(this.message);
}

class MedicinesEditError extends MedicinesState {
  final String errorMessage;

  MedicinesEditError(this.errorMessage);
}
//MedicinesTakeSuccess

class MedicinesTakeSuccess extends MedicinesState {
  String message;

  MedicinesTakeSuccess(this.message);
}

class MedicinesTakeError extends MedicinesState {
  final String errorMessage;

  MedicinesTakeError(this.errorMessage);
}

//MedicinesGetLogsError

class MedicinesGetLogsSuccess extends MedicinesState {
  List<LogsData> data;

  MedicinesGetLogsSuccess(this.data);
}

class MedicinesGetLogsError extends MedicinesState {
  final String errorMessage;

  MedicinesGetLogsError(this.errorMessage);
}
