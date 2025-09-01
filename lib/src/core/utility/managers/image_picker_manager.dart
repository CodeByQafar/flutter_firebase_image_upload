import 'package:image_picker/image_picker.dart';



abstract class ImagePickerManagerImpl {

  Future<XFile?> getImageGallery();

  Future<XFile?> getImageCamera();
}


class ImagePickerManager implements ImagePickerManagerImpl {

  ImagePickerManager._();

  static ImagePickerManager get instance => ImagePickerManager._();

  final ImagePicker _imagePicker = ImagePicker();

@override
 Future<XFile?> getImageGallery() async{
  return  await _imagePicker.pickImage(source: ImageSource.gallery);
}

@override
 Future<XFile?> getImageCamera() async{
  return  await _imagePicker.pickImage(source: ImageSource.camera);
}
}