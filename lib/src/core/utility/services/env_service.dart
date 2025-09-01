import 'package:firebase_image_upload/src/core/utility/exceptions/env_service_exception.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvService {
static  Future<void> envLoader() async {
    try {
      await dotenv.load(fileName: '.env');
    } catch (e) {
      throw EnvFileNotFound('Env file is not found ');
    }
  }

  static String get baseUrl =>
      dotenv.env['FIREBASE_BASE_API_URL'] ??
      'https://firebasestorage.googleapis.com/v0/b'; //-> this url same for all firebase user

  static String get bucketName =>
      dotenv.env['BUCKET_NAME'] ??
      'demo-bucket-name'; //if you want to test code with your own , so create new fireabase storage 
      //project and copy name of bucket and repllace it with this demo code
}
