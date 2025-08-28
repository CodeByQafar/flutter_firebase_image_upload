import 'package:flutter/material.dart';

class ImageUploadView extends StatelessWidget {
  const ImageUploadView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 1),
        Center(
          child: Card(
          
            color: Colors.white,
            child: GestureDetector(
              onDoubleTapDown: (details){
              
              },
                  onTap: () {
            },
              child: SizedBox.square(
                dimension: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.upload, size: 100),
                    Text('Tap to Upload image'),
                  ],
                ),
              ),
            ),
          ),
        ),
        const Spacer(flex: 2),
      ],
    );
  }
}
