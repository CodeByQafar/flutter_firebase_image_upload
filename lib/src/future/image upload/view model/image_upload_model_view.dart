import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_image_upload/src/core/utility/services/env_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

import '../model/image_upload_response.dart';
import '../service/image_upload_service.dart';
part 'image_upload_model_view.g.dart';

class ImageUploadModelView = _ImageUploadModelViewBase
    with _$ImageUploadModelView;

abstract class _ImageUploadModelViewBase with Store {
  static String baseUrl = EnvService.baseUrl + EnvService.bucketName;

  ImageUploadService imageUploadService = ImageUploadService(
    Dio(BaseOptions(baseUrl: baseUrl)),
  );

  @observable
  File? image;
  @observable
  bool isLoading = false;

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  void saveLocalImage(XFile? file) {
    if (file == null) return;
    image = File(file.path);
  }



  @action
  void removeLocalImage() {
    image = null;
  }

  @action
  Future<void> imageUploadToStorage() async {
    await imageUploadService.uploadImage(
      imageBytes: await image!.readAsBytes(),
      name: image!.path.split('/').last,
      onSendProgress: (count, total) {
        
      },
    );
  }
}
