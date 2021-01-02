import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trop_dart/ui/screens/auth/login/components/login_container.dart';

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Stack(
          // overflow: Overflow.visible,
          clipBehavior: Clip.none,
          children: <Widget>[
            Container(
              margin: const EdgeInsetsDirectional.only(top: 60.0),
              alignment: Alignment.center,
              child: Text(
                'Login',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
              ),
            ),
            Positioned(
                top: MediaQuery.of(context).size.height * 0.5,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                )),
            SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: LoginContainer(),
                )),
          ],
        ),
      ),
    );
  }
}
