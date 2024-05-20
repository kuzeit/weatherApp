import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:weatherapp/core/class/statusrequest.dart';
import 'package:flutter/material.dart';

import '../constant/app_assets.dart';

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
    return statusRequest.value == StatusRequest.loading
        ? buildLottieWidget(AppAssets.loading)
        : statusRequest == StatusRequest.success
            ? mainWidget
            : statusRequest.value == StatusRequest.offlinefailure
                ? buildLottieWidget(AppAssets.error2)
                : statusRequest.value == StatusRequest.serverfailure
                    ? buildLottieWidget(AppAssets.error)
                    : statusRequest.value == StatusRequest.failure
                        ? buildLottieWidget(AppAssets.error)
                        : buildLottieWidget(AppAssets.error);
  }

  Widget buildLottieWidget(String assetName) {
    return Center(child: Lottie.asset(assetName,height:45.h,width:86.w ,fit:BoxFit.fill  ));
  }
}
