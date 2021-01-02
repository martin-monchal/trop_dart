import 'dart:io';

import 'package:trop_dart/ui/resources/app_images.dart';

class ProfileUser {
  ProfileUser({this.userName, this.name, this.profilePicture})
      : defaultPicture = AppImages.profilePicture;
  String userName;
  String name;
  File profilePicture;
  String defaultPicture;

  void setName(String _name) => name = _name;

  void setUserName(String _userName) => userName = _userName;

  void setProfilePicture(File _image) => profilePicture = _image;

  void fromLogin(Map<String, String> userMap) {
    name = userMap['name'];
    userName = userMap['username'];
  }
}
