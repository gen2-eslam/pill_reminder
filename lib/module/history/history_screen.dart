import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_reminder/controller/medicines/medicines_cubit.dart';
import 'package:pill_reminder/core/helper/extensions.dart';
import 'package:pill_reminder/core/theme/manager/colors_manager.dart';
import 'package:pill_reminder/core/theme/manager/text_style_manager.dart';
import 'package:pill_reminder/core/utils/images_manager.dart';
import 'package:pill_reminder/core/widgets/custom_error.dart';
import 'package:pill_reminder/core/widgets/custom_text.dart';
import 'package:pill_reminder/model/medicines/medicines_model.dart';

class HistoryScreen extends StatefulWidget {
  final Medicines medicines;
  const HistoryScreen({super.key, required this.medicines});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void didChangeDependencies() {
    MedicinesCubit.get(context).getLogs(id: widget.medicines.id!);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "History",
          style: TextStyleManager.textStyle15w500,
        ),
        backgroundColor: ColorsManager.white,
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
      body: BlocBuilder<MedicinesCubit, MedicinesState>(
        builder: (context, state) {
          if (state is MedicinesGetLogsSuccess) {
            return ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.all(25.r),
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

                      leading: const Icon(
                        Icons.history,
                        color: ColorsManager.green,
                      ),
                      title: CustomText(
                        textAlign: TextAlign.start,
                        text: state.data[index].takenAt,
                        style: TextStyleManager.textStyle15w500,
                        color: ColorsManager.black,
                      ),
                      // trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 20.h);
                },
                itemCount: state.data.length);
          } else if (state is MedicinesGetLogsError) {
            return CustomError(errorMessage: state.errorMessage);
          } else {
            return const Center(
                child: CircularProgressIndicator(
              color: ColorsManager.green,
            ));
          }
        },
      ),
    );
  }
}
