import 'dart:async';

import 'package:booksapp_internship_assignment/app/data/local/local_implementation.dart';
import 'package:booksapp_internship_assignment/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final LocalImplementation _localData = LocalImplementation();

  @override
  void onInit() {
    super.onInit();
    nextDestination();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  nextDestination() {
    return Timer(
      const Duration(seconds: 3),
      () {
        final status = _localData.getStatus();

        if (status != null) {
          Get.offAllNamed(Routes.HOME);
        } else {
          Get.offAllNamed(Routes.LOGIN);
        }
      }
    );
  }
}
