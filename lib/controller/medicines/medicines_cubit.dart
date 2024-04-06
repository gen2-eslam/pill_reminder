import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pill_reminder/model/logs/logs_model.dart';
import 'package:pill_reminder/model/medicines/medicines_model.dart';
import 'package:pill_reminder/model/medicines/repo/medicines_repo.dart';

part 'medicines_state.dart';

class MedicinesCubit extends Cubit<MedicinesState> {
  MedicinesCubit() : super(MedicinesInitial());
  static MedicinesCubit get(context) => BlocProvider.of(context);
  MedicinesRepo medicinesRepo = MedicinesRepoImpl();

  Future<void> editMedicines({required Medicines medicines}) async {
    emit(MedicinesLoading());
    final response = await medicinesRepo.editMedicines(
        id: medicines.id!, medicines: medicines);
    response.fold((failures) {
      emit(MedicinesError(failures.errorMessage));
    }, (sucess) {
      emit(MedicinesEditSuccess(sucess.message));
    });
  }

  Future<void> takeMedicines({required int id}) async {
    emit(MedicinesLoading());
    final response = await medicinesRepo.takeMedicines(id: id);
    response.fold((failures) {
      emit(MedicinesTakeError(failures.errorMessage));
    }, (sucess) {
      emit(MedicinesTakeSuccess(sucess.message));
    });
  }

  Future<void> getLogs({required int id}) async {
    emit(MedicinesLoading());
    final response = await medicinesRepo.getLogs(id: id);
    response.fold((failures) {
      emit(MedicinesGetLogsError(failures.errorMessage));
    }, (sucess) {
      emit(MedicinesGetLogsSuccess(sucess));
    });
  }
}
