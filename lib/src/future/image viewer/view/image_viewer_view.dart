import 'package:dio/dio.dart';
import 'package:firebase_image_upload/src/core/utility/services/env_service.dart';
import 'package:firebase_image_upload/src/future/image%20viewer/model/image_viewr_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../view model/image_viewer_view_model.dart';

class ImageViewerView extends StatefulWidget {
  const ImageViewerView({super.key});

  @override
  State<ImageViewerView> createState() => _ImageViewerViewState();
}

class _ImageViewerViewState extends State<ImageViewerView> {
  ImageViewerViewModel viewModel = ImageViewerViewModel();
  List<String?> imagesUrls = List.empty();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final response = await viewModel.listAllImages();
      setState(() {
        if (response == null) {
          imagesUrls = List.empty();
        } else {
          imagesUrls = response.items!.map((item) => item.name).toList();
        }
      });

      print(imagesUrls);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return viewModel.isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: imagesUrls.length,
                itemBuilder: (BuildContext context, int i) {
                  return Image.network(
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
               EnvService.baseUrl+EnvService.bucketName + (imagesUrls[i] ?? '').replaceAll('/', '%2F') + '?alt=media'
                  );
                },
              );
      },
    );
  }
}
