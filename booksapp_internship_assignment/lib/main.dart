import 'package:booksapp_internship_assignment/app/utils/colors.dart';
import 'package:booksapp_internship_assignment/app/utils/global.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: globalNavKey,
      title: "Application",
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: primaryColor
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
