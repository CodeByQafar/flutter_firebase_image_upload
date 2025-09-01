import 'package:firebase_image_upload/src/future/home/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/core/theme/theme.dart';
import 'src/core/utility/services/env_service.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
    await EnvService.envLoader();
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
