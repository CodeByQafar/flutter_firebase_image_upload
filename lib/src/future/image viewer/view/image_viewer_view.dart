import 'package:flutter/material.dart';

class ImageViewerView extends StatelessWidget {
  const ImageViewerView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: Text('Image Viewer')),
      ],
    );
  }
}