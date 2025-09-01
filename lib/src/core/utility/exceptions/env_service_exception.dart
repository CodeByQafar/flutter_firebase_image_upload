class EnvFileNotFound implements Exception{

EnvFileNotFound(this.message);
String message;

@override
  String toString() {
    return "Error Message: $message";
  }

}