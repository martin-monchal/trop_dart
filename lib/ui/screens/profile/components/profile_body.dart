import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trop_dart/ui/resources/app_colors.dart';
import 'package:trop_dart/ui/screens/shared/model/profile_user.dart';

class ProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ProfileUser>(context, listen: false);
    return Column(
      children: <Widget>[
        _ProfileListItem(
          icon: Icons.person_outline,
          value: user.name ?? 'Undefined',
          editIcon: Icons.edit,
        ),
        _ProfileListItem(
          icon: Icons.lock,
          editIcon: Icons.edit,
          value: 'Password',
        ),
      ],
    );
  }
}

class _ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final IconData editIcon;

  _ProfileListItem({@required this.icon, @required this.value, this.editIcon});

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
              onTap: () => null,
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
