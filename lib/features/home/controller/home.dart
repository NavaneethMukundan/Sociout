import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sociout/features/main/view/main_screen.dart';
import 'package:sociout/features/register/view/signin.dart';
import 'package:sociout/utils/route.dart';

class HomeController extends ChangeNotifier {
  void logout(context) async {
    final prefs = await SharedPreferences.getInstance();
    final isloggedout = await prefs.setBool('loggedin', false);
    if (isloggedout) {
      RouteNavigator.pushRemoveUntil(context, const SigninPage());
    } else {
      RouteNavigator.pushRemoveUntil(context, MainScreen());
    }
  }
}
