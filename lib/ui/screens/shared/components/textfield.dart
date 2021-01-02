import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trop_dart/ui/resources/app_colors.dart';

class CustomTextfield extends StatelessWidget {
  CustomTextfield(
      {this.controller, this.hintText, this.inputType, this.hidePassword});
  final TextEditingController controller;
  final String hintText;
  final TextInputType inputType;
  final bool hidePassword;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: hidePassword ?? false,
      controller: controller,
      textInputAction: TextInputAction.done,
      keyboardType: inputType ?? TextInputType.text,
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
        hintText: hintText,
        filled: true,
        fillColor: AppColors.textfieldColor,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(
            Radius.circular(4.0),
          ),
        ),
      ),
    );
  }
}
