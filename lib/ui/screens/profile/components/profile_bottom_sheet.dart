import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trop_dart/ui/resources/app_colors.dart';

/* File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  } */

class ProfileBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                _ActionItem(icon: Icons.camera, onPressed: null),
                _ActionItem(icon: Icons.photo, onPressed: null),
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
