import 'package:firebase_image_upload/src/future/image%20upload/view%20model/image_upload_model_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/mixins/image_picker_mixin.dart';
import '../../../core/utility/image_picker_manager.dart';

class ImageUploadView extends StatefulWidget {
  ImageUploadView({super.key});

  @override
  State<ImageUploadView> createState() => _ImageUploadViewState();
}

class _ImageUploadViewState extends State<ImageUploadView>
    with ImagePickerManagerMixin {
  double iconSize = 100;

  double dimension = 200;

  String text = 'Tap to Upload image';

  final ImageUploadModelView modelView = ImageUploadModelView();
  XFile? image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 1),
        Center(
          child: Card(
            child: GestureDetector(
              onTap: () async {
                modelView.imageUpload(
                  await imagePickerManager.getImageGallery(),
                );
              },

              child: SizedBox.square(
                dimension: dimension,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.upload, size: iconSize),
                    Text(text),
                    Observer(
                      builder: (context) {
                        return modelView.image != null
                            ? Image.file(modelView.image!)
                            : SizedBox.shrink();
                      },
                    ),
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
