import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({
    super.key,
    this.width,
    this.height,
    this.radius,
    this.margin,
  });
  final EdgeInsets? margin;
  final double? width, height, radius;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[200]!,
      highlightColor: Colors.grey[400]!,
      child: Container(
        margin: margin,
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius!),
          color: Colors.white,
        ),
      ),
    );
  }
}
