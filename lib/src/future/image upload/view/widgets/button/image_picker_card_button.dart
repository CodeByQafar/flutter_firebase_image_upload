import 'package:flutter/material.dart';

class ImagePickerCardButton extends StatelessWidget {
  ImagePickerCardButton({super.key, required this.onPressed});
  final String text = 'Tap to Upload image';
  final double dimension = 200;
  final double iconSize = 100;
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: GestureDetector(
          onTap: onPressed,
          child: SizedBox.square(
            dimension: dimension,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.upload, size: iconSize),
                Text(text, style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
