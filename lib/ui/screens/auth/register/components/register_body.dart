import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:trop_dart/app/app_services.dart';
import 'package:trop_dart/ui/resources/app_colors.dart';
import 'package:trop_dart/ui/screens/routes.dart';
import 'package:trop_dart/ui/screens/shared/components/login_confirm_button.dart';
import 'package:trop_dart/ui/screens/shared/components/textfield.dart';

class RegisterBody extends StatefulWidget {
  @override
  _RegisterBodyState createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  TextEditingController _userNameController;
  TextEditingController _passwordController;
  TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _userNameController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Decoration loginContainerDecoration = BoxDecoration(
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
    );

    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.45,
        width: MediaQuery.of(context).size.width * 0.80,
        decoration: loginContainerDecoration,
        child: Stack(
          overflow: Overflow.visible,
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
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: 200,
                    child: CustomTextfield(
                      controller: _confirmPasswordController,
                      hintText: 'Confirm Password',
                      hidePassword: true,
                    ),
                  ),
                ],
              ),
            ),
            LoginConfirmButton(
              onPressed: () async {
                if (_userNameController.text.length == 0 ||
                    _confirmPasswordController.text.length == 0 ||
                    _passwordController.text.length == 0 ||
                    _confirmPasswordController.text !=
                        _passwordController.text) {
                  showSimpleNotification(
                    Text('Passwords must be the same'),
                    background: AppColors.errorColor,
                    duration: Duration(milliseconds: 1500),
                  );
                } else {
                  await ApplicationServices.sharedPreferences.register(
                      _userNameController.text, _passwordController.text);

                  Navigator.of(context).pushNamed(AppRoutes.routeApp);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _userNameController.dispose();
    _confirmPasswordController.dispose();
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
