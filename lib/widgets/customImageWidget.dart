import 'package:flutter/material.dart';

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
    return Image.network(
      fit: BoxFit.cover,
      imageUrl,
      height: height,
      width: width,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child; // Main image loaded
        } else {
          return Container(); // Empty container while loading
        }
      },
    );
  }
}
