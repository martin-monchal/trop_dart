import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trop_dart/ui/app.dart';
import 'package:trop_dart/ui/screens/auth/login/login_screen.dart';
import 'package:trop_dart/ui/screens/auth/register/register_screen.dart';
import 'package:trop_dart/ui/utils/routes.dart';
import 'package:trop_dart/utils/platform_utils.dart';

class AppRoutes {
  static const String routeHome = '/';
  static const String routeLogin = '/login';
  static const String routeRegister = '/register';
  static const String routeApp = '/app';

  const AppRoutes._();

  static Route<dynamic> getRoutes(RouteSettings settings) {
    WidgetBuilder builder;
    _PageAnimation animation = _PageAnimation.horizontal;

    String routeName = _rewriteRoute(settings);

    switch (routeName) {
      case routeLogin:
        builder = (BuildContext context) => LoginScreen();
        animation = _PageAnimation.horizontal;
        break;
      case routeRegister:
        builder = (BuildContext context) => RegisterScreen();
        animation = _PageAnimation.horizontal;
        break;
      case routeApp:
        builder = (BuildContext context) => App();
        animation = _PageAnimation.horizontal;
        break;
    }

    if (animation == _PageAnimation.horizontal) {
      return _HorizontalRoute<dynamic>(builder: builder, settings: settings);
    } else {
      return _VerticalRoute<dynamic>(builder: builder, settings: settings);
    }
  }

  static String _rewriteRoute(RouteSettings settings) {
    if (settings.name == routeHome) {
      return routeLogin;
    }
    return settings.name;
  }
}

/// Default "slide from bottom" animation on both platforms
class _VerticalRoute<T> extends MaterialPageRoute<T> {
  _VerticalRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings, fullscreenDialog: true);
}

/// Default slide animations on iOS and zoom on Android
class _HorizontalRoute<T> extends MaterialPageRoute<T> {
  _HorizontalRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings, fullscreenDialog: false);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (PlatformUtils.isIOS) {
      return super
          .buildTransitions(context, animation, secondaryAnimation, child);
    } else {
      return ZoomPageTransition(
        animation: animation,
        secondaryAnimation: secondaryAnimation,
        child: child,
      );
    }
  }
}

enum _PageAnimation { vertical, horizontal }
