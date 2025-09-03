import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_image_upload/src/core/utility/enums/api_enums.dart';

import '../model/image_viewr_model.dart';

class ImageViewerService {
  final Dio dio;
  ImageViewerService(this.dio);

  Future<ImageViewerResponse?> listAllImages()async{
   final response= await dio.get('/o?prefix=${ApiFolderNames.uploads.name}/${ApiFolderNames.images.name}/');
    if(response.statusCode==HttpStatus.ok){
      return ImageViewerResponse.fromJson(response.data);
    }else{
      return null;
    }
  }

}