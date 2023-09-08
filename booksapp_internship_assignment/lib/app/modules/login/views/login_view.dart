import 'package:booksapp_internship_assignment/app/utils/colors.dart';
import 'package:booksapp_internship_assignment/app/utils/extensions.dart';
import 'package:booksapp_internship_assignment/app/utils/font_sizes.dart';
import 'package:booksapp_internship_assignment/app/widgets/custom_form.dart';
import 'package:booksapp_internship_assignment/app/widgets/default_button.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Log In',
                style: h3(color: primaryColor),
              ),
              Text(
                'to your account',
                style: h5(color: primaryColor),
              ),
              const Spacer(),
              CustomForm(
                formKey: controller.emailFormKey, 
                autovalidateMode: controller.autoValidateEmail, 
                controller: controller.emailController, 
                hintText: 'E-mail',
                prefixIcon: const Icon(
                  Icons.mail_outline,
                  color: primaryColor,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide a proper e-mail address';
                  } else {
                    bool validate = EmailValidator.validate(value);

                    if (!validate) {
                      return 'Invalid e-mail address';
                    }
                  }
                }
              ),
              const SizedBox(height: 15),
              DefaultButton(
                onTap: () {
                  controller.initiateLogin();
                }, 
                color: primaryColor, 
                buttonText: 'Login'
              )
            ],
          ),
        ),
      ),
    );
  }
}
