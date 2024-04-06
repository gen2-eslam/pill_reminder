import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:pill_reminder/model/medicines/medicines_model.dart';
import 'package:pill_reminder/model/medicines/repo/medicines_repo.dart';

part 'medicien_state.dart';

class EditMedicienCubit extends Cubit<EditMedicienState> {
  EditMedicienCubit({required this.medicinesRepo}) : super(MedicienInitial());
  MedicinesRepo medicinesRepo;
  static EditMedicienCubit get(context) => BlocProvider.of(context);

  final ImagePicker picker = ImagePicker();
  TextEditingController pillNameController = TextEditingController();
  //dosage
  TextEditingController dosageNameController = TextEditingController();

  DateTime? date = DateTime.now();
  Medicines medicines = Medicines(type: "fares");

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

  void addController() {
    medicines.name = pillNameController.text;
    medicines.dosage = dosageNameController.text;
    medicines.startTime = DateFormat('yyyy-MM-dd HH:mm').format(date!);
  }

  Future<void> addMedecin() async {
    emit(MedicienLoading());
    final response =
        await medicinesRepo.addMedicines(medicines: medicines, image: image!);
    response.fold((failures) {
      emit(MedicienError(failures.errorMessage));
    }, (sucess) {
      emit(MedicienAddSuccess(sucess.message));
    });
  }

  @override
  Future<void> close() {
    pillNameController.dispose();
    dosageNameController.dispose();
    return super.close();
  }
}
