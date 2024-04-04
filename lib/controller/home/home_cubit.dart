import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pill_reminder/core/error/failure.dart';
import 'package:pill_reminder/model/medicines/medicines_model.dart';
import 'package:pill_reminder/model/medicines/repo/medicines_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.medicinesRepo}) : super(HomeInitial());
  MedicinesRepo medicinesRepo;
  static HomeCubit get(context) => BlocProvider.of(context);

  Future<void> getMedicines() async {
    emit(MedicinesLoading());
    final response = await medicinesRepo.getMedicines();
    response.fold((failures) {
      emit(MedicinesError(failures.errorMessage));
    }, (medicines) {
      emit(MedicinesSuccess(medicines));
    });
  }

}
