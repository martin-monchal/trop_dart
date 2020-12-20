import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trop_dart/ui/resources/app_colors.dart';
import 'package:trop_dart/ui/resources/app_images.dart';
import 'package:trop_dart/ui/screens/profile/components/bottom_profile_button.dart';
import 'package:trop_dart/ui/screens/profile/components/profile_body.dart';
import 'package:trop_dart/ui/screens/shared/model/profile_user.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _ProfileHeader(),
        Expanded(
          child: ProfileBody(),
        ),
        BottomProfileButton(
          onPressed: null,
        ),
      ],
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ProfileUser>(context, listen: false);
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.35,
      child: Stack(
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width,
                maxWidth: MediaQuery.of(context).size.width,
                minHeight: MediaQuery.of(context).size.height * 0.30,
                maxHeight: MediaQuery.of(context).size.height * 0.30),
            child: DecoratedBox(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin:
                  const EdgeInsetsDirectional.only(top: kToolbarHeight + 30.0),
              child: Text(user.userName,
                  style: TextStyle(
                      fontSize: 30.0,
                      color: AppColors.white,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(AppImages.profilePicture),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
