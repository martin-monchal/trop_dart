import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trop_dart/ui/resources/app_colors.dart';

class LoginTextfield extends StatelessWidget {
  final TextEditingController controller;

  LoginTextfield(this.controller);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.name,
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
        hintText: 'Username',
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
