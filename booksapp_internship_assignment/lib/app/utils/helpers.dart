import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSnackbar(String title, String message) {
  Get.snackbar(
    title, 
    message,
    backgroundColor: Colors.white,
    snackPosition: SnackPosition.BOTTOM,
    margin: const EdgeInsets.all(20),
    borderRadius: 20,
    boxShadows: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        spreadRadius: 5,
        blurRadius: 7,
        offset: const Offset(0, 3)
      )
    ]
  );
}

loaderDialog(Widget loaderIcon, String message) {
  return Get.dialog(
    AlertDialog(
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      content: Row(
        children: [
          SizedBox(
            width: 75,
            height: 50,
            child: loaderIcon,
          ),
          const Padding(
            padding: EdgeInsets.all(5),
          ),
          Expanded(
            child: Text(
              message,
              overflow: TextOverflow.fade,
              maxLines: 3,
            ),
          )
        ],
      )
    ),
    barrierDismissible: true
  );
}