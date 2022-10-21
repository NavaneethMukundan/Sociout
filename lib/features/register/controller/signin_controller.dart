import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sociout/features/main/view/main_screen.dart';
import 'package:sociout/features/register/model/login/login_model.dart';
import 'package:sociout/features/register/model/login/login_response.dart';
import 'package:sociout/features/register/services/login_services.dart';
import 'package:sociout/utils/route.dart';
import 'package:sociout/utils/snackbar.dart';

class SigninController extends ChangeNotifier {
  final signinKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isloading = false;

  void loginButton(context) async {
    if (signinKey.currentState!.validate()) {
      isloading = true;
      notifyListeners();

      final loginObj = LoginModel(
          email: emailController.text, password: passwordController.text);

      LoginResponse? loginResponse =
          await LoginServices().signinServices(loginObj);
      if (loginResponse == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('No Response'));
        _isLoadingFalse();
        return;
      } else if (loginResponse.loggedin == true) {
        final preference = await SharedPreferences.getInstance();
        preference.setString('token', loginResponse.token.toString());
        await preference.setBool('loggedin', true);
        RouteNavigator.pushRemoveUntil(context, MainScreen());
        _isLoadingFalse();
        return;
      } else if (loginResponse.success == false ||
          loginResponse.loggedin != true) {
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('${loginResponse.message}'));
        _isLoadingFalse();
        return;
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('Something Went Wrong'));
        _isLoadingFalse();
      }
    }
  }

  void _isLoadingFalse() {
    isloading = false;
    notifyListeners();
  }

  bool _isHidden = false;
  get isHidden => _isHidden;
  set isHidden(value) {
    _isHidden = value;
    notifyListeners();
  }

  bool _isCheck = false;
  get isCheck => _isCheck;
  set isCheck(value) {
    _isCheck = value;
    notifyListeners();
  }

  void disposes() {
    signinKey.currentState!.reset();
    emailController.clear();
    passwordController.clear();
    isHidden = true;
    notifyListeners();
  }
}
