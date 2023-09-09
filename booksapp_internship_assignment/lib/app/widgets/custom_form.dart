import 'package:booksapp_internship_assignment/app/utils/colors.dart';
import 'package:booksapp_internship_assignment/app/utils/font_sizes.dart';
import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  final Key? formKey;
  final AutovalidateMode? autovalidateMode;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType input;
  final int minLines;
  final int maxLines;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  const CustomForm({
    super.key,
    required this.formKey, 
    required this.autovalidateMode,
    required this.controller, 
    this.obscureText = false,
    this.input = TextInputType.text,
    this.minLines = 1,
    this.maxLines = 1,
    required this.hintText, 
    this.suffixIcon, 
    this.prefixIcon, 
    required this.validator,
    this.onChanged
  });

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      autovalidateMode: widget.autovalidateMode,
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        keyboardType: widget.input,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        decoration: InputDecoration(
          hintText: widget.hintText,
          errorMaxLines: 2,
          hintStyle: h5(
            color: textGrey,
            fontWeight: FontWeight.normal
          ),
          contentPadding: const EdgeInsets.all(20),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: primaryColor,
              width: 2
            )
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: contextGrey,
              width: 2
            )
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: contextRed,
              width: 2
            )
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: contextRed,
              width: 2
            )
          ),
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
        ),
        validator: widget.validator,
        onChanged: widget.onChanged,
      )
    );
  }
}