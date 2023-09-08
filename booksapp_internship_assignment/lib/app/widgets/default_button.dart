import 'package:booksapp_internship_assignment/app/utils/colors.dart';
import 'package:booksapp_internship_assignment/app/utils/font_sizes.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final void Function()? onTap;
  final Color? color;
  final String buttonText;
  final Color buttonTextColor;

  const DefaultButton({
    super.key, 
    required this.onTap, 
    required this.color, 
    required this.buttonText,
    this.buttonTextColor = textBlack
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), 
          color: color
        ),
        child: Text(
          buttonText,
          style: buttonLg(color: buttonTextColor),
        ),
      ),
    );
  }
}
