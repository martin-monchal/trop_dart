import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:trop_dart/app/app_services.dart';
import 'package:trop_dart/ui/resources/app_colors.dart';
import 'package:trop_dart/ui/screens/routes.dart';
import 'package:trop_dart/ui/screens/shared/components/login_confirm_button.dart';
import 'package:trop_dart/ui/screens/shared/components/textfield.dart';
import 'package:trop_dart/ui/screens/shared/model/profile_user.dart';

double _getHeightContainer(BuildContext context) {
  return math.max(300.0, MediaQuery.of(context).size.height * 0.40);
}

class LoginContainer extends StatefulWidget {
  @override
  _LoginContainerState createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  TextEditingController _userNameController;
  TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _userNameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ProfileUser>(context);
    return Container(
      height: _getHeightContainer(context),
      width: MediaQuery.of(context).size.width * 0.80,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        // overflow: Overflow.visible,
        clipBehavior: Clip.none,
        children: <Widget>[
          _PictureOverflow(),
          Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 60.0),
                SizedBox(
                  width: 200,
                  child: CustomTextfield(
                    controller: _userNameController,
                    hintText: 'Username',
                    inputType: TextInputType.name,
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: 200,
                  child: CustomTextfield(
                    controller: _passwordController,
                    hintText: 'Password',
                    hidePassword: true,
                  ),
                ),
                const SizedBox(height: 30.0),
                InkWell(
                  onTap: () =>
                      Navigator.of(context).pushNamed(AppRoutes.routeRegister),
                  child: Text('REGISTER',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0)),
                )
              ],
            ),
          ),
          LoginConfirmButton(
            onPressed: () async {
              Map<String, String> userMap = ApplicationServices
                  .sharedPreferences
                  .login(_userNameController.text, _passwordController.text);

              if (userMap == null) {
                showSimpleNotification(
                  Text('Wrong password'),
                  background: AppColors.errorColor,
                  duration: Duration(milliseconds: 1500),
                );
              } else {
                user.fromLogin(userMap);
                bool exists = await File(userMap['image']).exists();
                if (exists) {
                  user.setProfilePicture(File(userMap['image']));
                }
                Navigator.of(context).pushNamed(AppRoutes.routeApp);
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _userNameController.dispose();
    super.dispose();
  }
}

class _PictureOverflow extends StatelessWidget {
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
