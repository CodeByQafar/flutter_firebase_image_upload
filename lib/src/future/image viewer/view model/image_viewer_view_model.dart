import 'package:dio/dio.dart';
import 'package:firebase_image_upload/src/core/utility/services/env_service.dart';
import 'package:firebase_image_upload/src/future/image%20viewer/service/image_viewer_service.dart';
import 'package:mobx/mobx.dart';

import '../model/image_viewr_model.dart';

part 'image_viewer_view_model.g.dart';

class ImageViewerViewModel = _ImageViewerViewModelBase
    with _$ImageViewerViewModel;

abstract class _ImageViewerViewModelBase with Store {
  static String baseUrl = EnvService.baseUrl + EnvService.bucketName;
  final ImageViewerService imageViewerService = ImageViewerService(
    Dio(BaseOptions(baseUrl: baseUrl)),
  );

  @observable
  bool isLoading = false;

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<ImageViewerResponse?> listAllImages() async {
    changeLoading();
    final response = await imageViewerService.listAllImages();
    changeLoading();
    return response;
  }
}
