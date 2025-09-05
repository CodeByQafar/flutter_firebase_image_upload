import 'package:firebase_image_upload/src/future/image%20viewer/view/widgets/card/custom_image_card.dart';
import '../../../core/utility/constants/assets.dart';
import '../view model/image_viewer_view_model.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((_)  {
    _loadImages();
    });
  }

Future<void> _loadImages()async{
    final response = await viewModel.listAllImages();
      setState(() {
        if (response == null) {
          imagesUrls = List.empty();
        } else {
          imagesUrls = response.items!.map((item) => item.name).toList();
        }
      });
}
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return viewModel.isLoading
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Spacer(flex: 2),
                  CircularProgressIndicator(),
                  Spacer(flex: 2),
                ],
              )
            : imagesUrls.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Spacer(flex: 1),
                  SizedBox.square(
                    dimension: 300,
                    child: Lottie.asset(Assets.lottieNotFound),
                  ),
                  Spacer(flex: 2),
                ],
              )
            : RefreshIndicator(
              onRefresh: _loadImages,
              child: ListView.builder(
                  itemCount: imagesUrls.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomImageCard(imagesUrls: imagesUrls[index]);
                  },
                ),
            );
      },
    );
  }
}

