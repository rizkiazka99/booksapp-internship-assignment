import 'package:booksapp_internship_assignment/app/data/api/auth/login/login_implementation.dart';
import 'package:booksapp_internship_assignment/app/data/api/auth/login/login_usecase.dart';
import 'package:booksapp_internship_assignment/app/data/model/login_response.dart';
import 'package:booksapp_internship_assignment/app/routes/app_pages.dart';
import 'package:booksapp_internship_assignment/app/utils/colors.dart';
import 'package:booksapp_internship_assignment/app/utils/helpers.dart';
import 'package:booksapp_internship_assignment/app/utils/result.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  final emailFormKey = GlobalKey<FormState>();
  var autoValidateEmail = AutovalidateMode.disabled;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }

  Future<void> initiateLogin() async {
    final isEmailValid = emailFormKey.currentState!.validate();

    if (isEmailValid) {
      late LoginUseCase login;
      late Result<LoginResponse> result;
      LoginParams params = LoginParams(
        email: emailController.text.trim()
      );

      loaderDialog(
        const SpinKitRing(color: primaryColor), 
        'Please wait...'
      );
      login = LoginUseCase(api_repository: LoginImplementation());
      result = await login.call(params);

      if (result.status is Success) {
        Get.back();
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.back();
        showSnackbar('Oops!', result.message);
      }
    } else {
      autoValidateEmail = AutovalidateMode.always;
    }
  }
}
