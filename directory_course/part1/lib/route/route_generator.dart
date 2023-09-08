import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation3_course/page/home_page.dart';
import 'package:navigation3_course/page/notification_page.dart';
import 'package:navigation3_course/page/settings.dart';
import 'package:navigation3_course/page/user_page.dart';

class RouteGenerator {
  Route? routeGenerate(RouteSettings route) {


    switch (route.name) {
      case '/':
        return navigateToRoute(const HomePage());

      case '/settings':
        return navigateToRoute(const Settings());

      case '/userPage':
        return navigateToRoute(const UserPage());

      case '/notificationPage':
        return navigateToRoute(const NotificationPage());
    }

    return null;
  }

  navigateToRoute(Widget page) {
    if (Platform.isAndroid) {
      return MaterialPageRoute(builder: (context) => page);
    }

    if (Platform.isIOS) {
      return CupertinoPageRoute(builder: (context) => page);
    }
  }
}