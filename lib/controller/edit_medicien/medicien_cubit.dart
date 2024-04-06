import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pill_reminder/model/medicines/medicines_model.dart';
import 'package:pill_reminder/model/medicines/repo/medicines_repo.dart';
import 'package:pill_reminder/module/add_mdecine/add_medecine_screen.dart';

part 'medicien_state.dart';

class EditMedicienCubit extends Cubit<EditMedicienState> {
  EditMedicienCubit({required this.medicinesRepo}) : super(MedicienInitial());
  MedicinesRepo medicinesRepo;
  static EditMedicienCubit get(context) => BlocProvider.of(context);

  final ImagePicker picker = ImagePicker();

  File? image;
  Future<void> getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      emit(AddImageSucess());
    } else {
      if (image == null) {
        emit(AddImageError('No image selected'));
      }
    }
  }

  Future<void> addMedecin({required Medicines medicines}) async {
    emit(MedicienLoading());
    final response =
        await medicinesRepo.addMedicines(medicines: medicines, image: image!);
    response.fold((failures) {
      emit(MedicienError(failures.errorMessage));
    }, (sucess) {
      emit(MedicienAddSuccess(sucess.message));
    });
  }
}
