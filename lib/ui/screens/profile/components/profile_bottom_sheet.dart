import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:trop_dart/ui/resources/app_colors.dart';
import 'package:trop_dart/ui/screens/shared/model/profile_user.dart';

class ProfileBottomSheet extends StatelessWidget {
  final ValueChanged<File> onChanged;

  ProfileBottomSheet({@required this.onChanged});

  Future<File> getImage(ImageSource imageSource) async {
    ImagePicker picker = ImagePicker();
    File image;
    final pickedFile = await picker.getImage(source: imageSource);

    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
    return image;
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ProfileUser>(context);
    return Container(
      padding: const EdgeInsets.all(20.0),
      height: 200.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Choose an action',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
          ),
          const SizedBox(height: 40.0),
          SizedBox(
            width: 200.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _ActionItem(
                  icon: Icons.camera,
                  onPressed: () async {
                    File _image = await getImage(ImageSource.camera);

                    user.setProfilePicture(_image);
                    onChanged(_image);
                  },
                ),
                _ActionItem(
                  icon: Icons.photo,
                  onPressed: () async {
                    File _image = await getImage(ImageSource.gallery);

                    user.setProfilePicture(_image);
                    onChanged(_image);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionItem extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  _ActionItem({@required this.icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle, border: Border.all(color: AppColors.black)),
      height: 70.0,
      width: 70.0,
      child: InkWell(
        child: Icon(icon, size: 50.0, color: AppColors.black),
        onTap: onPressed,
      ),
    );
  }
}
