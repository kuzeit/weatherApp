// import 'package:flutter/material.dart';
//
// import '../model/weather_data_current.dart';
// import '../utils/app_assets.dart';
// import '../utils/custom_colors.dart';
//
// class CurrentWeatherMoreDetailsWidget extends StatelessWidget {
//   final double screenWidth;
//   final double screenHeight;
//   final WeatherDataCurrent weatherDataCurrent;
//
//   const CurrentWeatherMoreDetailsWidget({
//     required this.screenWidth,
//     required this.screenHeight,
//     required this.weatherDataCurrent,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             currentWeatherCardWidget(AppAssets.windSpeed,
//                 "${weatherDataCurrent.current.windSpeed}km/h"),
//             currentWeatherCardWidget(
//                 AppAssets.clouds, "${weatherDataCurrent.current.clouds}%"),
//             currentWeatherCardWidget(
//                 AppAssets.humidity, "${weatherDataCurrent.current.humidity}%"),
//           ],
//         ),
//         SizedBox(
//           height: screenHeight * 0.0176, // 10/568.8888888888889
//         ),
//       ],
//     );
//   }
//
//   Widget currentWeatherCardWidget(String imagePath, String detailes) {
//     final iconSize = screenWidth * 0.1875; // 60/320
//     final textSize = screenWidth * 0.1875; // 60/320
//
//     return Column(
//       children: [
//         Container(
//           height: iconSize,
//           width: iconSize,
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: CustomColors.cardColor,
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: Image.asset(imagePath),
//         ),
//         SizedBox(
//           height: screenHeight * 0.0352, // 20/568.8888888888889
//           width: textSize,
//           child: Text(
//             detailes,
//             style: TextStyle(fontSize: screenWidth * 0.0375), // 12/320
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ],
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// import '../model/weather_data_current.dart';
// import '../utils/app_assets.dart';
// import '../utils/custom_colors.dart';
// import '../utils/custom_colors.dart';
// import '../utils/screen_size_utils.dart';
//
// class CurrentWeatherMoreDetailsWidget extends StatelessWidget {
//   final WeatherDataCurrent weatherDataCurrent;
//   late double  widthPercent;
//   late double heightPercent ;
//
//
//   CurrentWeatherMoreDetailsWidget({Key? key, required this.weatherDataCurrent})
//       : super(key: key);
//    @override
//   Widget build(BuildContext context) {
//       widthPercent = getWidthPercent(context);
//       heightPercent = getHeightPercent(context);
//
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             currentWeatherCardWidget(
//               AppAssets.windSpeed,
//               "${weatherDataCurrent.current.windSpeed}km/h",
//              ),
//             currentWeatherCardWidget(
//               AppAssets.clouds,
//               "${weatherDataCurrent.current.clouds}%",
//              ),
//             currentWeatherCardWidget(
//               AppAssets.humidity,
//               "${weatherDataCurrent.current.humidity}%",
//              ),
//           ],
//         ),
//         SizedBox(
//           height: heightPercent * 10,
//         ),
//       ],
//     );
//   }
//
//   Widget currentWeatherCardWidget(
//       String imagePath,
//       String details,
//        ) {
//     final iconSize = widthPercent * 60;
//
//     return Column(
//       children: [
//         Container(
//           height: iconSize,
//           width: iconSize,
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: CustomColors.cardColor,
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: Image.asset(imagePath),
//         ),
//         SizedBox(
//           height: heightPercent*20, // Adjusted to textHeight
//           width: widthPercent * 60,
//           child: Text(
//             details,
//             style: TextStyle(fontSize: widthPercent * 12),
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ],
//     );
//   }
// }
// import 'package:flutter/material.dart';
//
// import '../model/weather_data_current.dart';
// import '../utils/app_assets.dart';
// import '../utils/custom_colors.dart';
//
// class CurrentWeatherMoreDetailsWidget extends StatelessWidget {
//   final double screenWidth;
//   final double screenHeight;
//   final WeatherDataCurrent weatherDataCurrent;
//
//   const CurrentWeatherMoreDetailsWidget({
//     required this.screenWidth,
//     required this.screenHeight,
//     required this.weatherDataCurrent,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             currentWeatherCardWidget(AppAssets.windSpeed,
//                 "${weatherDataCurrent.current.windSpeed}km/h"),
//             currentWeatherCardWidget(
//                 AppAssets.clouds, "${weatherDataCurrent.current.clouds}%"),
//             currentWeatherCardWidget(
//                 AppAssets.humidity, "${weatherDataCurrent.current.humidity}%"),
//           ],
//         ),
//         SizedBox(
//           height: screenHeight * 0.0176,
//         ),
//       ],
//     );
//   }
//
//   Widget currentWeatherCardWidget(String imagePath, String detailes) {
//     final iconSize = screenWidth * 0.1875;
//     final textSize = screenWidth * 0.1875;
//
//     return Column(
//       children: [
//         Container(
//           height: iconSize,
//           width: iconSize,
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: CustomColors.cardColor,
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: Image.asset(imagePath),
//         ),
//         SizedBox(
//           height: screenHeight * 0.0352,
//           width: textSize,
//           child: Text(
//             detailes,
//             style: TextStyle(fontSize: screenWidth * 0.0375),
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';

import '../../model/weather_data_current.dart';
import '../../core/constant/app_assets.dart';
import '../../core/constant/custom_colors.dart';
import 'package:sizer/sizer.dart';

class CurrentWeatherMoreDetailsWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;

  const CurrentWeatherMoreDetailsWidget({
    required this.weatherDataCurrent,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        currentWeatherCardWidget(
          AppAssets.windSpeed,
          "${weatherDataCurrent.current.windSpeed}km/h",
        ),
        currentWeatherCardWidget(
          AppAssets.clouds,
          "${weatherDataCurrent.current.clouds}%",

        ),
        currentWeatherCardWidget(
          AppAssets.humidity,
          "${weatherDataCurrent.current.humidity}%",

        ),
      ],
    );
  }

  Widget currentWeatherCardWidget(String imagePath,
      String details,) {
    final iconSize = 18.0.w;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w,vertical:0.7.h ),
      decoration: BoxDecoration(
        color: CustomColors.cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Container(
            height: iconSize,
            width: iconSize,
            padding: EdgeInsets.symmetric(horizontal: 3.2.w,vertical:0.1.h ),
            child: Image.asset(imagePath),
          ),
          SizedBox(
            height: 3.8.h,
            width: 18.w,
            child: Text(
              details,
              style: TextStyle(fontSize: 12.sp),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
