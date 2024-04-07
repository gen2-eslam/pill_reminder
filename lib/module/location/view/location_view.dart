import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pill_reminder/core/theme/manager/colors_manager.dart';
import 'package:pill_reminder/core/theme/manager/text_style_manager.dart';
import 'package:pill_reminder/core/utils/string_manager.dart';
import 'package:pill_reminder/core/widgets/custom_elevated_button.dart';
import 'package:pill_reminder/core/widgets/custom_error.dart';
import 'package:pill_reminder/core/widgets/custom_text.dart';
import 'package:pill_reminder/module/location/logic/cubit/location_cubit.dart';


class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  late LocationCubit cubit;

  @override
  void didChangeDependencies() async {
    cubit = LocationCubit.get(context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        fit: StackFit.loose,
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.topCenter,
        children: [
          BlocBuilder<LocationCubit, LocationState>(builder: (_, state) {
            if (state is LocationFailure) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomError(
                    errorMessage: state.message,
                  ),
                  CustomElevatedButton(
                      child: CustomText(
                        text: StringManager.retry,
                        style: TextStyleManager.textStyle15w500,
                        color: ColorsManager.white,
                      ),
                      onPressed: () async {
                        cubit.getMyCurrentLocation();
                      }),
                ],
              );
            } else if (state is LocationSuccess) {
              return GoogleMap(
                  initialCameraPosition:
                      const CameraPosition(target: LatLng(0, 0), zoom: 0),
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  mapType: MapType.normal,
                  onMapCreated: (GoogleMapController controller) {
                    cubit.setMapController(controller);
                    cubit.getRealTimeLocation();
                  });
            } else {
              return const CircularProgressIndicator(
                color: ColorsManager.green,
              );
            }
          }),
          Positioned(
            right: 5.r,
            bottom: 10.r,
            child: GestureDetector(
              onTap: () {
                cubit.getMyCurrentLocation();
              },
              child: const CircleAvatar(
                child: Icon(Icons.location_on),
              ),
            ),
          ),
        ]);
  }
}
