import 'package:booksapp_internship_assignment/app/utils/colors.dart';
import 'package:booksapp_internship_assignment/app/utils/font_sizes.dart';
import 'package:booksapp_internship_assignment/app/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String content;
  final void Function() onConfirmation;
  
  const ConfirmationDialog({
    super.key, 
    required this.title, 
    required this.content, 
    required this.onConfirmation
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.white,
      actionsPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: h5(),
        textAlign: TextAlign.center,
      ),
      content: Text(
        content,
        style: bodyMd(color: contextGrey),
        textAlign: TextAlign.center,
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: DefaultButton(
                onTap: onConfirmation, 
                color: primaryColor,
                buttonTextColor: Colors.white,
                buttonText: 'Yes'
              )
            ),
            const SizedBox(width: 10),
            Expanded(
              child: DefaultButton(
                onTap: () {
                  Get.back();
                }, 
                color: contextRed,
                buttonTextColor: Colors.white,
                buttonText: 'No'
              )
            )
          ],
        )
      ],
    );
  }
}