import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ListTileSkeleton extends StatelessWidget {
  const ListTileSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final baseColor = Theme.of(context).colorScheme.surface;
    final highLightColor = Theme.of(context).colorScheme.surfaceContainerLow;
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highLightColor,
      child: ListTile(
        leading: SizedBox.square(
          dimension: 48,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: baseColor,
            ),
          ),
        ),
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: baseColor,
          ),
          width: MediaQuery.of(context).size.width * .7,
          height: 16,
        ),
        subtitle: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: baseColor,
          ),
          width: MediaQuery.of(context).size.width * .6,
          height: 16,
        ),
      ),
    );
  }
}
