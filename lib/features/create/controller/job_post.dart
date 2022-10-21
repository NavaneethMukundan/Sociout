import 'package:flutter/cupertino.dart';
import 'package:sociout/features/main/view/main_screen.dart';
import 'package:sociout/utils/route.dart';

class JobPostController extends ChangeNotifier {
  final companyName = TextEditingController();
  final companyPlace = TextEditingController();
  final companystate = TextEditingController();
  final companyCountry = TextEditingController();
  final jobDesignation = TextEditingController();
  final jobVaccancies = TextEditingController();
  final minSalary = TextEditingController();
  final maxSalary = TextEditingController();
  final jobDiscription = TextEditingController();
  final minExp = TextEditingController();
  final maxExp = TextEditingController();
  bool displayNewTextfield = false;
  final jobFormKey = GlobalKey<FormState>();

  String groupValue = '';
  radioButton(value) {
    groupValue = value;
    notifyListeners();
  }

  validator(context) {
    if (jobFormKey.currentState!.validate()) {
      RouteNavigator.pushRoute(context, MainScreen());
    } else {
      print('Data is Empty');
    }
  }
}
