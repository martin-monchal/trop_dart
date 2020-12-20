import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trop_dart/ui/resources/app_colors.dart';

class BottomProfileButton extends StatelessWidget {
  final VoidCallback onPressed;

  BottomProfileButton({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius = BorderRadius.all(Radius.circular(6.0));

    return SizedBox(
      height: 100.0,
      width: double.infinity,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 0.0,
            maxWidth: 300.0,
            minHeight: 50.0,
            maxHeight: 50.0,
          ),
          child: InkWell(
            borderRadius: borderRadius,
            onTap: onPressed,
            child: Ink(
              decoration: BoxDecoration(
                  borderRadius: borderRadius, color: AppColors.buttonColor),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Center(
                child: Text(
                  'Change Profile Picture',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                      color: AppColors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
