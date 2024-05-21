import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:weatherapp/core/class/statusrequest.dart';
import 'package:flutter/material.dart';

import '../constant/app_assets.dart';
import '../constant/app_theme.dart';

// //
class HandlingDataView extends StatelessWidget {
  final Rx<StatusRequest> statusRequest;
  final Widget mainWidget;

  const HandlingDataView({
    Key? key,
    required this.statusRequest,
    required this.mainWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest.value == StatusRequest.loading ||
            statusRequest.value == StatusRequest.none
        ? buildLottieWidget(AppAssets.loading, "loading ... ")
        : statusRequest.value == StatusRequest.success
            ? mainWidget
            : statusRequest.value == StatusRequest.offlinefailure
                ? buildLottieWidget(AppAssets.error2, " offline failure ")
                : statusRequest.value == StatusRequest.serverfailure
                    ? buildLottieWidget(AppAssets.error2, "server failure ")
                    : buildLottieWidget(AppAssets.error2, "unknown error");
  }
}

class HandlingSectionDataView extends StatelessWidget {
  final Rx<StatusRequest> statusRequest;
  final Widget mainWidget;

  const HandlingSectionDataView({
    Key? key,
    required this.statusRequest,
    required this.mainWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest.value == StatusRequest.loading ||
            statusRequest.value == StatusRequest.none
        ? buildSizedBoxWidget("loading ... ")
        : statusRequest.value == StatusRequest.success
            ? mainWidget
            : statusRequest.value == StatusRequest.offlinefailure
                ? buildSizedBoxWidget(" offline failure ")
                : statusRequest.value == StatusRequest.serverfailure
                    ? buildSizedBoxWidget("server failure ")
                    : buildSizedBoxWidget("unknown error");
  }
}

Widget buildSizedBoxWidget(String text) {
  return SizedBox(
      height: 25.sp,
      child: Text(
        text,
        style: AppTheme.textTheme.bodyText1,
      ));
}

Widget buildLottieWidget(String assetName, String text) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          assetName,
          //height:45.h,width:86.w ,
          // fit:BoxFit.fill
        ),
        SizedBox(height: 10.sp),
        Text(
          text,
          style: AppTheme.textTheme.bodyText1,
        )
      ],
    ),
  );
}
