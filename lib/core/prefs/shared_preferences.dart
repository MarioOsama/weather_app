import 'package:shared_preferences/shared_preferences.dart';

Future<bool> get userStatus async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
  if (isFirstTime == true) {
    // Change user status
    prefs.setBool('isFirstTime',
        true); // set to true for testing, do not forget to change it to false when done
  }
  return isFirstTime;
}
