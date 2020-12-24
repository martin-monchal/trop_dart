import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:trop_dart/app/app_services.dart';
import 'package:trop_dart/ui/resources/app_colors.dart';
import 'package:trop_dart/ui/screens/shared/components/textfield.dart';
import 'package:trop_dart/ui/screens/shared/model/profile_user.dart';
import 'package:trop_dart/ui/utils/dialog_utils.dart';

class ProfileBody extends StatefulWidget {
  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  TextEditingController usernameController;
  TextEditingController passwordController;
  TextEditingController confirmPasswordController;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ProfileUser>(context);
    return Column(
      children: <Widget>[
        _ProfileListItem(
          icon: Icons.person_outline,
          value: user.name.length > 0 ? user.name : 'Undefined',
          editIcon: Icons.edit,
          onPressed: () => DialogUtils.showCustomDialog(
            context,
            title: 'New Username',
            onPressed: () async {
              if (usernameController.text.length > 0) {
                setState(() {
                  user.setName(usernameController.text);
                });

                await ApplicationServices.sharedPreferences
                    .setName(usernameController.text);
                return true;
              } else {
                showSimpleNotification(
                  Text('Name must be not null'),
                  background: AppColors.errorColor,
                  duration: Duration(milliseconds: 1500),
                );
                return false;
              }
            },
            content: CustomTextfield(
              hintText: 'username',
              inputType: TextInputType.name,
              controller: usernameController,
            ),
          ),
        ),
        _ProfileListItem(
          icon: Icons.lock,
          editIcon: Icons.edit,
          value: 'Password',
          onPressed: () => DialogUtils.showCustomDialog(
            context,
            title: 'New Password',
            onPressed: () async {
              if (passwordController.text.length > 0 &&
                  confirmPasswordController.text.length > 0 &&
                  passwordController.text == confirmPasswordController.text) {
                await ApplicationServices.sharedPreferences
                    .register(user.userName, passwordController.text);
                return true;
              } else {
                showSimpleNotification(
                  Text('Passwords must be the same'),
                  background: AppColors.errorColor,
                  duration: Duration(milliseconds: 1500),
                );
                return false;
              }
            },
            content: SizedBox(
              height: 120.0,
              child: Column(
                children: <Widget>[
                  CustomTextfield(
                    hintText: 'password',
                    inputType: TextInputType.name,
                    controller: passwordController,
                  ),
                  const SizedBox(height: 18.0),
                  CustomTextfield(
                    hintText: 'confirm password',
                    inputType: TextInputType.name,
                    controller: confirmPasswordController,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}

class _ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final IconData editIcon;
  final VoidCallback onPressed;

  _ProfileListItem(
      {@required this.icon,
      @required this.value,
      @required this.onPressed,
      this.editIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.itemListBorder),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
      child: Row(
        children: <Widget>[
          SizedBox(
            height: 30.0,
            width: 30.0,
            child: Icon(icon),
          ),
          Expanded(
              child: Align(
            alignment: Alignment.center,
            child: Text(
              value,
              style: TextStyle(
                  color: AppColors.textColorGrey,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0),
            ),
          )),
          Visibility(
            visible: editIcon != null,
            child: InkWell(
              onTap: onPressed,
              child: SizedBox(
                height: 30.0,
                width: 30.0,
                child: Icon(editIcon, color: AppColors.textColorGrey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
