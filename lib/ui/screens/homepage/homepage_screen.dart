import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trop_dart/ui/resources/app_colors.dart';
import 'package:trop_dart/ui/screens/homepage/components/homepage_body.dart';

class HomePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beers map'),
        backgroundColor: AppColors.primary,
      ),
      body: HomePageBody(),
    );
  }
}
