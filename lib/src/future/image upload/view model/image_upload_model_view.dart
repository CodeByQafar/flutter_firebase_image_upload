import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

import '../service/image_upload_service.dart';
part 'image_upload_model_view.g.dart';

class ImageUploadModelView = _ImageUploadModelViewBase
    with _$ImageUploadModelView;

abstract class _ImageUploadModelViewBase with Store {

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
  Future<Response<dynamic>> imageUploadToStorage() async {
  
 return   imageUploadService.uploadImage(
      imageBytes: await image!.readAsBytes(),
      name: image!.path.split('/').last,
      onSendProgress: (count, total) {
        Future.delayed(Duration(milliseconds: 500), () {
          print(
            'Uploaded $count of $total bytes - ${(count / total * 100).toStringAsFixed(0)}%',
          );
        });
      },
    );
  }
}
