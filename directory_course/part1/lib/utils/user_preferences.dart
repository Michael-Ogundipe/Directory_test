import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences preferences;

  static const keyValue = 'value';

  Future<void> init() async =>
      preferences = await SharedPreferences.getInstance();

  static Future<void> showOnboarding(bool value) async =>
      await preferences.setBool(keyValue, value);

  static isOnboarded() => preferences.getBool(keyValue);
}
