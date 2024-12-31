// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/app_numbers.dart';

class SmallImagePreview extends StatefulWidget {
  const SmallImagePreview({
    super.key,
    this.imageUrl,
    required this.selectedImage,
    required this.index,
    required this.onTap,
  });

  final String? imageUrl;
  final int selectedImage, index;
  final void Function()? onTap;

  @override
  State<SmallImagePreview> createState() => _SmallImagePreviewState();
}

class _SmallImagePreviewState extends State<SmallImagePreview> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.only(right: padding4 * 4),
        padding: EdgeInsets.all(padding4 * 2),
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          // color: Theme.of(context).colorScheme.surfaceContainerLowest,
          color: Theme.of(context).colorScheme.tertiaryContainer,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: widget.selectedImage == widget.index
                ? Theme.of(context).colorScheme.inversePrimary
                : Colors.transparent,
          ),
        ),
        child: Image.network(widget.imageUrl!),
      ),
    );
  }
}
