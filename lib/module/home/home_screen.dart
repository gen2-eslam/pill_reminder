import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_reminder/controller/home/home_cubit.dart';
import 'package:pill_reminder/core/helper/extensions.dart';
import 'package:pill_reminder/core/helper/keys.dart';
import 'package:pill_reminder/core/routes/routes.dart';
import 'package:pill_reminder/core/services/cache_service.dart';
import 'package:pill_reminder/core/theme/manager/colors_manager.dart';
import 'package:pill_reminder/core/theme/manager/text_style_manager.dart';
import 'package:pill_reminder/core/widgets/custom_error.dart';
import 'package:pill_reminder/core/widgets/custom_text.dart';
import 'package:pill_reminder/core/widgets/pill_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    HomeCubit.get(context).getMedicines();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: context.deviceWidth,
          padding: EdgeInsets.all(25.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text: "Hello,\n",
                      style: TextStyleManager.textStyle28w600.copyWith(
                        color: ColorsManager.blackWithOpacity,
                      ),
                      children: [
                        TextSpan(
                          text: CacheService.getDataString(key: Keys.name),
                          style: TextStyleManager.textStyle28w400.copyWith(
                            color: ColorsManager.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      context.pushNamed(Routes.notificationScreen);
                    },
                    icon: const Icon(
                      Icons.notifications,
                      color: ColorsManager.green,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.pushNamed(
                        Routes.profileScreen,
                      );
                    },
                    icon: const Icon(
                      Icons.person,
                      color: ColorsManager.green,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomText(
                text: "Daily Review",
                style: TextStyleManager.textStyle17w500,
                color: ColorsManager.black,
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is MedicinesSuccess) {
                      return ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: const BoxDecoration(
                              color: ColorsManager.lightGray,
                              borderRadius: BorderRadius.all(
                                Radius.circular(24),
                              ),
                            ),
                            child: ListTile(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(24),
                                ),
                              ),
                              onTap: () {
                                context.pushNamed(Routes.medecineScreen,
                                    arguments:
                                        state.medicinesModel.data[index]);
                              },
                              leading: const PillIcon(),
                              title: CustomText(
                                textAlign: TextAlign.start,
                                text: state.medicinesModel.data[index].name!,
                                style: TextStyleManager.textStyle15w500,
                                color: ColorsManager.black,
                              ),
                              subtitle: CustomText(
                                textAlign: TextAlign.start,
                                text:
                                    state.medicinesModel.data[index].startTime!,
                                style: TextStyleManager.textStyle13w500,
                                color: ColorsManager.gray,
                              ),
                              trailing: const Icon(Icons.arrow_forward_ios),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            height: 10.r,
                            color: Colors.transparent,
                          );
                        },
                        itemCount: state.medicinesModel.data.length,
                      );
                    } else if (state is MedicinesError) {
                      return CustomError(errorMessage: state.errorMessage);
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: ColorsManager.green,
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
          bottom: context.deviceHeight * 0.05.r,
          right: context.deviceWidth * 0.05.r,
        ),
        child: FloatingActionButton(
          onPressed: () {
            context.pushNamed(Routes.addMedecineScreen);
          },
          backgroundColor: ColorsManager.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              18.r,
            ),
          ),
          child: const Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
