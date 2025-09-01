import 'dart:io';

import 'package:dio/dio.dart';
import 'dart:typed_data';

import '../model/image_upload_response.dart';

class ImageUploadService {
  final Dio dio;
  ImageUploadService(this.dio);

  Future<ImageUploadResponse?> uploadImage({
    void Function(int, int)? onSendProgress,
    required Uint8List imageBytes,
    required String name,
  }) async {
    final response = await dio.post(
      '/o?name=${FolderName.uploads.name}/${FolderName.images.name}/$name.jpg',
      onSendProgress: onSendProgress,
      data: imageBytes,
    );
    if (response.statusCode == HttpStatus.ok) {
      print(response.data);
      return ImageUploadResponse.fromJson(response.data);
    } else {
      return null;
    }
  }
}

enum FolderName { uploads, images }
