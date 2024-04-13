import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pill_reminder/model/medicines/medicines_model.dart';
import 'package:pill_reminder/model/medicines/repo/medicines_repo.dart';

part 'one_medicine_state.dart';

class OneMedicineCubit extends Cubit<OneMedicineState> {
  OneMedicineCubit() : super(OneMedicineInitial());

  MedicinesRepo medicinesRepo = MedicinesRepoImpl();

  static OneMedicineCubit get(context) => BlocProvider.of(context);



  Future<void> getOneMedicine(int id) async {
    emit(OneMedicineLoading());
    final response = await medicinesRepo.getOneMedicine(id: id);
    response.fold((failures) {
      emit(OneMedicineError(failures.errorMessage));
    }, (medicines) {
      emit(OneMedicineSuccess(medicines));
    });
  }
}
