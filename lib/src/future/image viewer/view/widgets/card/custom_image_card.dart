import 'package:flutter/material.dart';
import '../../../../../core/utility/constants/padding.dart';
import '../../../../../core/utility/services/env_service.dart';

class CustomImageCard extends StatelessWidget {
  const CustomImageCard({super.key, required this.imagesUrls});

  final String? imagesUrls;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.imageCardPaddings,
      child: Card(
        child: Padding(
          padding: Paddings.imageCardPaddings,

          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.width * 0.35,
            child: Image.network(
              '${EnvService.baseUrl}${EnvService.bucketName}/o/${(imagesUrls ?? '').replaceAll('/', '%2F')}?alt=media',
            ),
          ),
        ),
      ),
    );
  }
}
