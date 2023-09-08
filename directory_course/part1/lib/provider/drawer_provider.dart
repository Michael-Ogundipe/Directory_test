import 'package:flutter/material.dart';
import 'package:navigation3_course/page/favorite_page.dart';
import 'package:navigation3_course/page/home_page.dart';
import 'package:navigation3_course/page/notification_page.dart';

class DrawerProvider extends ChangeNotifier {
  late Widget page = const HomePage();

  Widget get currentPage => page;

  set currentPage(Widget newPage) {
    page = newPage;
    notifyListeners();
  }

  void changePage(Pages page) {
    switch (page) {
      case Pages.homepage:
        currentPage = const HomePage();
        break;
      case Pages.favorite:
        currentPage = const FavoritePage();
        break;
      case Pages.notification:
        currentPage = const NotificationPage();
        break;
      default:
        currentPage = const HomePage();
        break;
    }
  }
}

enum Pages { homepage, favorite, notification }
