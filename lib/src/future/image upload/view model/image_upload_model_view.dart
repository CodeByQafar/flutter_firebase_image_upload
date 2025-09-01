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
  void uploadImageUrl(dynamic response) {
    if (response == null) return;
    print(
      '$baseUrl/o/' +
          (response.name?.replaceAll('/', '%2F') ?? '')+'?alt=media&token=${response.downloadTokens}',
    );
  }

  @action
  void removeLocalImage() {
    image = null;
  }

  @action
  Future<void> imageUploadToStorage() async {
    print(baseUrl);
    final response = await imageUploadService.uploadImage(
      imageBytes: await image!.readAsBytes(),
      name: image!.path.split('/').last,
      onSendProgress: (count, total) {
        // Future.delayed(Duration(seconds: 1), () {
        //   print(
        //     'Uploaded $count of $total bytes - ${(count / total * 100).toStringAsFixed(0)}%',
        //   );
        // });
      },
    );
    uploadImageUrl(response);
  }
}
