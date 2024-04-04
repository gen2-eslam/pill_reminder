import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pill_reminder/model/personalData/personal_data.dart';
import 'package:pill_reminder/model/personalData/repo/personal_data_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.personalDataRepo}) : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);
  PersonalDataRepo personalDataRepo;

  Future<void> getPersonalData() async {
    emit(GetPersonalDataLoadingState());
    final response = await personalDataRepo.getPersonalData();
    response.fold(
      (l) => emit(GetPersonalDataErrorState(errorMessage: l.errorMessage)),
      (r) => emit(GetPersonalDataSuccessState(personalDataModel: r)),
    );
  }
}
