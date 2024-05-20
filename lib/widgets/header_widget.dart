import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/controller/global_controller.dart';
import 'package:sizer/sizer.dart';
import 'package:weatherapp/core/constant/app_theme.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = "Irbin";
  String date = DateFormat("yMMMMd").format(DateTime.now());

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    final lat = globalController.getLattitude().value;
    final lon = globalController.getLongitude().value;
    getAddress(lat, lon);
    super.initState();
  }

  getAddress(lat, lon) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
    Placemark place = placemark[0];
    setState(() {
      city = place.locality!;
    });
  }

  late Position position;

  getCurrentLocation() async {}

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6.25.w),
      // 20/320, 20/568.8888888888889
      alignment: Alignment.topLeft,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            city,
            style: AppTheme.textTheme.headline2?.copyWith(fontSize:20.sp ),
          ),
          Text(
            date,
            style: AppTheme.textTheme.bodyText1,

          ),
        ],
      ),
    );
  }
}
