import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sociout/features/main/view/main_screen.dart';
import 'package:sociout/features/main/view/onboard.dart';
import 'package:sociout/utils/route.dart';

class SplashController extends ChangeNotifier {
  splashCheck(context) async {
    await Future.delayed(const Duration(seconds: 3));
    final preference = await SharedPreferences.getInstance();
    final isLoggin = preference.getBool('loggedin') ?? false;
    if (isLoggin) {
      RouteNavigator.pushReplacement(context, MainScreen());
    } else {
      RouteNavigator.pushReplacement(context, const OnBoardPage());
    }
  }
}
