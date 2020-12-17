import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trop_dart/ui/resources/app_colors.dart';

class PictureOverflow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.40 - 40,
      top: -40,
      child: Container(
        width: 80.0,
        height: 80.0,
        decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: Theme.of(context).primaryColor),
            shape: BoxShape.circle),
        child: Icon(
          Icons.people,
          size: 50,
        ),
      ),
    );
  }
}
