import 'package:flutter/material.dart';
import 'package:trop_dart/ui/resources/app_colors.dart';

class LoginConfirmButton extends StatelessWidget {
  final VoidCallback onPressed;

  LoginConfirmButton({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(6.0));
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.40 - 50,
      bottom: -17,
      child: ConstrainedBox(
        constraints: BoxConstraints(
            minWidth: 100.0,
            maxWidth: double.infinity,
            minHeight: 40.0,
            maxHeight: 40.0),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            borderRadius: borderRadius,
            onTap: onPressed,
            child: Ink(
              decoration: BoxDecoration(
                  borderRadius: borderRadius, color: AppColors.buttonColor),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Icon(
                Icons.arrow_right_alt_outlined,
                color: AppColors.white,
                size: 40.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
