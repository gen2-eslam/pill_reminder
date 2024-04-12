import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_reminder/controller/profile/profile_cubit.dart';
import 'package:pill_reminder/core/helper/extensions.dart';
import 'package:pill_reminder/core/routes/routes.dart';
import 'package:pill_reminder/core/services/cache_service.dart';
import 'package:pill_reminder/core/theme/manager/colors_manager.dart';
import 'package:pill_reminder/core/theme/manager/text_style_manager.dart';
import 'package:pill_reminder/core/widgets/custom_error.dart';
import 'package:pill_reminder/core/widgets/custom_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Profile",
          style: TextStyleManager.textStyle15w500,
        ),
        backgroundColor: ColorsManager.white,
        actions: [
          IconButton(
            onPressed: () {
              CacheService.clearData();
              context.pushNamedAndRemoveUntil(Routes.loginScreen,
                  predicate: (r) => false);
            },
            icon: const Icon(
              Icons.exit_to_app,
              color: ColorsManager.redClr,
            ),
          ),
        ],
        leading: InkWell(
          onTap: () {
            context.pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: ColorsManager.gray,
          ),
        ),
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
        if (state is GetPersonalDataSuccessState) {
          return Container(
            width: context.deviceWidth,
            padding: EdgeInsets.all(25.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: context.deviceWidth * 0.2,
                  child: Image.network(
                      state.personalDataModel.personalData.avatar),
                ),
                SizedBox(height: 20.h),
                ProfileDetails(
                  title: "Neme",
                  value: state.personalDataModel.personalData.name,
                ),
                SizedBox(height: 20.h),
                ProfileDetails(
                  title: "phone",
                  value: state.personalDataModel.personalData.phone,
                ),
                SizedBox(height: 20.h),
                ProfileDetails(
                  title: "email",
                  value: state.personalDataModel.personalData.email,
                ),
              ],
            ),
          );
        } else if (state is GetPersonalDataErrorState) {
          return CustomError(errorMessage: state.errorMessage);
        } else {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.green,
          ));
        }
      }),
    );
  }
}

class ProfileDetails extends StatelessWidget {
  final String title;
  final String value;
  const ProfileDetails({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.r),
      constraints: BoxConstraints(minWidth: context.deviceWidth * 0.3),
      decoration: BoxDecoration(
        color: ColorsManager.lightGray,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FittedBox(
            child: CustomText(
              text: title,
              style: TextStyleManager.textStyle15w500,
            ),
          ),
          SizedBox(width: 30.w),
          FittedBox(
            child: CustomText(
              text: value,
              style: TextStyleManager.textStyle15w500,
            ),
          ),
        ],
      ),
    );
  }
}
