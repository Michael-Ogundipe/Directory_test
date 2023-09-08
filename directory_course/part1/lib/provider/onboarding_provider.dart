import 'package:flutter/material.dart';

class OnboardingProvider extends ChangeNotifier {
  int currentPage = 1;

  void navigateToPage(int page) {
    currentPage = page;
    notifyListeners();
  }
}
