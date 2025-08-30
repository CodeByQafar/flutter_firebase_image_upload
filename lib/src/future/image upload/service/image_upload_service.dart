import 'dart:io';

import 'package:dio/dio.dart';
import 'dart:typed_data';

class ImageUploadService {
  final Dio dio;
  ImageUploadService(this.dio);

  Future<Response<dynamic>> uploadImage({
    void Function(int, int)? onSendProgress,
    required Uint8List imageBytes,
    required String name,
  }) async {
    final response = await dio.post(
      '/o?name=${FolderName.uploads.name}/${FolderName.images.name}/$name',
      onSendProgress: onSendProgress,
      data: imageBytes,
    );
    if (response.statusCode == HttpStatus.ok) {
      print('Image uploaded successfully');
    } else {
      print('Image upload failed');
    }
    return response;
  }
}

enum FolderName { uploads, images }
