import 'package:flutter/material.dart';
import 'package:trop_dart/ui/resources/app_colors.dart';
import 'package:trop_dart/ui/screens/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: AppColors.primary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: AppRoutes.getRoutes,
    );
  }
}
