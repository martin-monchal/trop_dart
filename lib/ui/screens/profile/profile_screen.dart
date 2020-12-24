import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:trop_dart/app/app_services.dart';
import 'package:trop_dart/ui/resources/app_colors.dart';
import 'package:trop_dart/ui/screens/profile/bloc/profile_bloc.dart';
import 'package:trop_dart/ui/screens/profile/components/bottom_profile_button.dart';
import 'package:trop_dart/ui/screens/profile/components/profile_body.dart';
import 'package:trop_dart/ui/screens/profile/components/profile_bottom_sheet.dart';
import 'package:trop_dart/ui/screens/shared/model/profile_user.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ProfileUser>(context, listen: false);
    return BlocProvider<ProfileBloc>(
      create: (_) => ProfileBloc(initialImage: user.profilePicture),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (BuildContext context, ProfileState state) {
          return Column(
            children: <Widget>[
              _ProfileHeader(),
              Expanded(
                child: ProfileBody(),
              ),
              BottomProfileButton(onPressed: () async {
                File image = await showBarModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) => ProfileBottomSheet(
                    onChanged: (File image) => Navigator.pop(context, image),
                  ),
                );

                BlocProvider.of<ProfileBloc>(context)
                    .changeProfilePicture(image);

                if (image != null) {
                  ApplicationServices.sharedPreferences.setPicture(image.path);
                }
              }),
            ],
          );
        },
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ProfileUser>(context, listen: false);
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (BuildContext context, ProfileState state) {
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
                  decoration:
                      BoxDecoration(color: Theme.of(context).primaryColor),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsetsDirectional.only(
                      top: MediaQuery.of(context).size.height * 0.08),
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
                      image: state.map(
                        (ProfileStateData data) {
                          if (data.image != null) {
                            return FileImage(data.image);
                          } else {
                            return AssetImage(user.defaultPicture);
                          }
                        },
                        error: (_) => AssetImage(user.defaultPicture),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
