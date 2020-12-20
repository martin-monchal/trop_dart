import 'package:flutter/material.dart';

class BackButton extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;

  const BackButton({this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 13.0,
      icon: Icon(
        Icons.arrow_back,
        color: color ?? Theme.of(context).primaryColor,
        size: 13.0,
      ),
      onPressed: onPressed ?? () => Navigator.maybePop(context),
    );
  }
}
