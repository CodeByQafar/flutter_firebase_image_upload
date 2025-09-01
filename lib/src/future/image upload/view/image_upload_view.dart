import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_image_upload/src/future/image%20upload/service/image_upload_service.dart';
import 'package:firebase_image_upload/src/future/image%20upload/view/widgets/button/custom_text_button.dart';
import 'package:firebase_image_upload/src/future/image%20upload/view/widgets/button/image_picker_card_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../core/mixins/image_picker_mixin.dart';
import '../../../core/theme/colors.dart';
import '../../../core/utility/constants/animation_durations.dart';
import '../../../core/utility/constants/sized_box.dart';
import '../view model/image_upload_model_view.dart';

class ImageUploadView extends StatefulWidget {
  ImageUploadView({super.key});

  @override
  State<ImageUploadView> createState() => _ImageUploadViewState();
}

class _ImageUploadViewState extends State<ImageUploadView>
    with ImagePickerManagerMixin {
  final ImageUploadModelView viewModel = ImageUploadModelView();
  CrossFadeState cardOrImage = CrossFadeState.showFirst;
  void changeCrossFadeState() {
    setState(() {
      cardOrImage == CrossFadeState.showFirst
          ? cardOrImage = CrossFadeState.showSecond
          : cardOrImage = CrossFadeState.showFirst;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Spacer(flex: 1),
        AnimatedCrossFade(
          firstChild: ImagePickerCardButton(
            onPressed: () async {
              viewModel.saveLocalImage(
                await imagePickerManager.getImageGallery(),
              );
              if (viewModel.image == null) return;
              setState(() {
                changeCrossFadeState();
              });
            },
          ),
          secondChild: Observer(
            builder: (context) {
              return ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.9,
                  maxHeight: MediaQuery.of(context).size.height * 0.65,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: FittedBox(
                        child: viewModel.image == null
                            ? SizedBox()
                            : Image.file(viewModel.image!),
                      ),
                    ),
                    SizedBoxses.mediumHeight,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        CustomTextButton(
                          iconData: Icons.cancel_outlined,
                          color: AppColors.lustRed,
                          text: 'Remove',
                          onPressed: () {
                            viewModel.removeLocalImage();
                            changeCrossFadeState();
                          },
                        ),
                        SizedBoxses.mediumWidth,
                        CustomTextButton(
                          color: AppColors.malachiteGreen,
                          iconData: Icons.upload,
                          text: 'Upload',
                          onPressed: () async {
                            //final response =
                             await viewModel
                                .imageUploadToStorage();
                            // if (response.statusCode == HttpStatus.ok) {
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //     SnackBar(
                            //       content: Text('Image uploaded successfully!'),
                            //     ),
                            //   );
                            // }
                            ;
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),

          crossFadeState: cardOrImage,
          duration: AnimationDurations.medium,
          alignment: Alignment.center,
        ),

        Spacer(flex: 2),
      ],
    );
  }
}
