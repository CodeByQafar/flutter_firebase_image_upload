import 'package:firebase_image_upload/src/future/home/view/home.dart';
import 'package:flutter/material.dart';

import 'src/core/theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Image Upload',
      theme: AppTheme.theme,
      home: const HomeView(),
    );
  }
}
