import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trop_dart/ui/screens/auth/components/login_box.dart';

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Text('Login'),
            ),
            SizedBox(
              height: 20.0,
            ),
            LoginBox(),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
