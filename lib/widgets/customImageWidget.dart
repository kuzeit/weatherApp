import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;

  const NetworkImageWidget({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    //return
    // Image.network(
    // fit: BoxFit.cover,
    // imageUrl,
    // height: height,
    // width: width,
    // loadingBuilder: (BuildContext context, Widget child,
    //     ImageChunkEvent? loadingProgress) {
    //   if (loadingProgress == null) {
    //     return child; // Main image loaded
    //   } else {
    return SizedBox(
      width: width,
      height: height,
      child: Icon(
        Icons.cloud_off_outlined,
        //Icons.dangerous_rounded,

        color: Colors.grey[200],
        size: width,
      ),
      // decoration: BoxDecoration(
      //   shape: BoxShape.circle,
      //   color: Colors.grey[100],
      // ),
      //     ); // Empty container while loading
      //   }
      // },
    );
  }
}
