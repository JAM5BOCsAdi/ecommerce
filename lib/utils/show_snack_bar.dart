import 'package:get/get.dart';

GetSnackBar showSnackBar({
  required String title,
  required String errorMessage,
}) {
  return GetSnackBar(
    title: title,
    message: errorMessage,
    duration: const Duration(seconds: 3),
    snackPosition: SnackPosition.TOP,
  );
}
