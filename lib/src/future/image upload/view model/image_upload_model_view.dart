import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
part 'image_upload_model_view.g.dart';

// ignore: library_private_types_in_public_api
class ImageUploadModelView = _ImageUploadModelViewBase
    with _$ImageUploadModelView;

abstract class _ImageUploadModelViewBase with Store {
  @observable
  File? image;
  @observable
  bool isLoading = false;

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  void imageUpload(XFile? file) {
    if(file==null) return;
    image =File(file.path) ;
  }

  void init() {
    print('basladi');
  }
}
