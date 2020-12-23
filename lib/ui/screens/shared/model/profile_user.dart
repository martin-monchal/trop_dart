import 'dart:io';

import 'package:trop_dart/ui/resources/app_images.dart';

class ProfileUser {
  String userName;
  String name;
  File profilePicture;
  String defaultPicture;

  ProfileUser({this.userName, this.name, this.profilePicture})
      : defaultPicture = AppImages.profilePicture;

  void setName(String _name) => name = _name;

  void setUserName(String _userName) => userName = _userName;

  void setProfilePicture(File _image) => profilePicture = _image;
}
