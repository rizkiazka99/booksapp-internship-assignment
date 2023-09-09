import 'package:booksapp_internship_assignment/app/utils/colors.dart';
import 'package:booksapp_internship_assignment/app/utils/constants.dart';
import 'package:booksapp_internship_assignment/app/utils/extensions.dart';
import 'package:booksapp_internship_assignment/app/utils/font_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SplashController controller = Get.find<SplashController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Spacer(),
                Image.asset(appLogoBanner),
                Text(
                  'Internship Assignment',
                  style: h3(),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'by Rizki Azka',
                  style: h4(),
                ),
                const Spacer(),
                SpinKitRing(
                  color: primaryColor,
                  size: 35.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
