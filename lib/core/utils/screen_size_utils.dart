import 'package:flutter/widgets.dart';
double getWidthPercent(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  print("screenWidth ... $screenWidth" );
  return screenWidth ;
}
double getHeightPercent(BuildContext context) {
  final screenHeight = MediaQuery.of(context).size.height;
  print("screenhei ... $screenHeight" );

  return screenHeight ;
}

