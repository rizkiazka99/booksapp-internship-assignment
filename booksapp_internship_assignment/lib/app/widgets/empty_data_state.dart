import 'package:booksapp_internship_assignment/app/utils/constants.dart';
import 'package:booksapp_internship_assignment/app/utils/extensions.dart';
import 'package:booksapp_internship_assignment/app/utils/font_sizes.dart';
import 'package:flutter/material.dart';

class EmptyDataState extends StatelessWidget {
  final String message;

  const EmptyDataState({
    super.key, 
    required this.message
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          emptyDataIllustration,
          width: 300.w,
          height: 300.h,
        ),
        SizedBox(height: 15.h),
        Text(
          message,
          style: h5(fontWeight: FontWeight.normal),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}