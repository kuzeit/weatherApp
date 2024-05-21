import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/controller/global_controller.dart';
import 'package:sizer/sizer.dart';
import 'package:weatherapp/core/constant/app_theme.dart';

class HeaderWidget extends StatefulWidget {
  final String city;

  const HeaderWidget({Key? key, required this.city}) : super(key: key);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String date = DateFormat("yMMMMd").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6.25.w),
      alignment: Alignment.topLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.city,
            style: AppTheme.textTheme.headline2!.copyWith(fontSize: 20.sp),
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
