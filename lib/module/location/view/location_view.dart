import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pill_reminder/core/helper/extensions.dart';
import 'package:pill_reminder/core/theme/manager/colors_manager.dart';
import 'package:pill_reminder/core/theme/manager/text_style_manager.dart';

import 'package:pill_reminder/core/widgets/custom_text.dart';
import 'package:pill_reminder/module/location/logic/cubit/location_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class PharmacyModel {
  final String name;
  final double lat;
  final double long;
  final String phone;
  final String image;
  final String address;

  PharmacyModel({
    required this.name,
    required this.lat,
    required this.long,
    required this.phone,
    required this.image,
    required this.address,
  });
}

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  void phoneCall(String phone) async {
    Uri phoneUri = Uri(scheme: 'tel', path: phone);
    await launchUrl(phoneUri);
  }

  List<Marker> markers = [];
  List<PharmacyModel> pharmacies = [
    PharmacyModel(
        name: "El-Safa wel Marwa Pharmacy Cairo Since 1978",
        lat: 29.97658635427184,
        long: 31.258922356890285,
        phone: "+201003100040",
        image:
            "https://lh5.googleusercontent.com/p/AF1QipMY8gfelxjv7ydvNxHtQQFPe9gF7hgpYMIKLE8_=w426-h240-k-no",
        address: "Ahmed Zaki, Street 225, محافظة القاهر"),
    PharmacyModel(
        name: "RX Pharmacies فرع شارع 9 المعادي",
        lat: 29.96277259918883,
        long: 31.256693029290762,
        phone: "+201007576765",
        image:
            "https://lh5.googleusercontent.com/p/AF1QipNA_vc4V0jgXB9ej3mUOP7SiXbCQSJ0iXfy7AA=w408-h544-k-no",
        address:
            "امام البنك الاهلي المصري, 107 شارع 9, 77، تقاطع, قسم المعادي، محافظة  11728"),
    PharmacyModel(
        name: "Sara Sami Pharmacy",
        lat: 29.993582506261696,
        long: 31.229547723327645,
        phone: "+201111888333",
        image:
            "https://lh4.googleusercontent.com/hHrkg6ixzrkGEmjU8S7FlALEt39vd2PYhH8pDjf0mtGxQqY8k7aTlWQNTNpa_Ann=w493-h240-k-no",
        address:
            "X6VH+CR7، أثر النبي، قسم مصر القديمة، محافظة القاهرة‬ 4241101"),
  ];

  Location location = Location();
  GoogleMapController? mapController;
  void requestLocationPermission() async {
    var status = await Permission.location.status;
    if (!status.isGranted) {
      await Permission.location.request();
    }
  }

  void checkAndRequestLocationPermission() async {
    LocationData data = await Location.instance.getLocation();
    print(data.latitude);
    print(data.longitude);
  }

  late LocationCubit cubit;

  @override
  void initState() {
    checkAndRequestLocationPermission();
    markers = pharmacies
        .map(
          (e) => Marker(
            markerId: MarkerId(e.name),
            position: LatLng(e.lat, e.long),
            zIndex: 12,
            infoWindow: InfoWindow(
              title: e.name,
              snippet: e.phone,
            ),
          ),
        )
        .toList();
    // TODO: implement initState
    super.initState();
    // cubit = LocationCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        fit: StackFit.loose,
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.topCenter,
        children: [
          GoogleMap(
              markers: markers.toSet(),
              initialCameraPosition:
                  const CameraPosition(target: LatLng(0, 0), zoom: 0),
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              mapType: MapType.normal,
              onMapCreated: (GoogleMapController controller) {
                setState(() {
                  mapController = controller;
                  mapController!.animateCamera(
                    CameraUpdate.newLatLngZoom(
                      const LatLng(30.0444, 31.2357),
                      15,
                    ),
                  );
                });

                // cubit.setMapController(controller);
                // cubit.getRealTimeLocation();
              }),
          Positioned(
            right: 5.r,
            bottom: 10.r,
            child: GestureDetector(
              onTap: () {
                location.getLocation().then((value) {
                  mapController!.animateCamera(
                    CameraUpdate.newLatLng(
                      LatLng(value.latitude!, value.longitude!),
                    ),
                  );
                });
              },
              child: const CircleAvatar(
                child: Icon(Icons.location_on),
              ),
            ),
          ),
          Positioned(
            bottom: 10.r,
            child: SizedBox(
              width: context.deviceWidth,
              height: 200.h,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) {
                  mapController!.animateCamera(
                    CameraUpdate.newLatLng(
                      LatLng(pharmacies[value].lat, pharmacies[value].long),
                    ),
                  );
                },
                itemCount: pharmacies.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                      width: 300.w,
                      height: 100.h,
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image(
                              height: 40.h,
                              image: NetworkImage(pharmacies[index].image),
                            ),
                            CustomText(
                              text: pharmacies[index].name,
                              color: ColorsManager.black,
                              style: TextStyleManager.textStyle17w500,
                            ),
                            InkWell(
                              onTap: () {
                                phoneCall(pharmacies[index].phone);
                              },
                              child: CustomText(
                                text: pharmacies[index].phone,
                                color: ColorsManager.black,
                                style: TextStyleManager.textStyle17w500,
                              ),
                            ),
                            CustomText(
                              text: pharmacies[index].address,
                              color: ColorsManager.black,
                              style: TextStyleManager.textStyle17w500,
                            ),
                          ],
                        ),
                      ));
                },
              ),
            ),
          ),
        ]);
  }
}
