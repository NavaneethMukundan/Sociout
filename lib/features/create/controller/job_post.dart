import 'package:flutter/material.dart';
import 'package:sociout/features/create/model/job_post.dart';
import 'package:sociout/features/create/model/job_response.dart';
import 'package:sociout/features/create/services/job_create_services.dart';
import 'package:sociout/features/main/view/main_screen.dart';
import 'package:sociout/utils/route.dart';
import 'package:sociout/utils/snackbar.dart';

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
  String dropdownValue = 'Select';
  String jobType = '';

  void jobPostButton(context) async {
    if (jobFormKey.currentState!.validate() && jobType.isNotEmpty) {
      isloading = true;
      notifyListeners();

      // FlutterSecureStorage storage = const FlutterSecureStorage();
      // String? token = await storage.read(key: "token");

      final jobObj = JobPostModel(
        company: companyName.text,
        country: companyCountry.text,
        description: jobDiscription.text,
        designation: jobDesignation.text,
        jobFor: dropdownValue,
        jobType: jobType,
        place: companyPlace.text,
        salaryMax: maxSalary.text,
        salaryMin: minSalary.text,
        state: companystate.text,
        vacancy: jobVaccancies.text,
        expMax: minExp.text,
        expMin: minExp.text,
      );

      JobResponseModel? jobResponseModel =
          await JobCreateServices().jobPostServices(jobObj);

      if (jobResponseModel == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('No Response.....'));
        _isLoadingFalse();
        return;
      } else if (jobResponseModel.success == true) {
        RouteNavigator.pushRemoveUntil(context, MainScreen());
        _isLoadingFalse();
        return;
      } else if (jobResponseModel.success == false) {
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('Invalid Data'));
        _isLoadingFalse();
        return;
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('Something Went Wrong'));
        _isLoadingFalse();
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(ShowDialogs.popUp('Please select the Job Type'));
    }
  }

  String groupValue = '';
  radioButton(value) {
    groupValue = value;
    notifyListeners();
  }

  // validator(context) {
  //   if (jobFormKey.currentState!.validate() && jobType.isNotEmpty) {
  //     RouteNavigator.pushRoute(context, MainScreen());
  //   } else {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(ShowDialogs.popUp('Please select the Job Type'));
  //   }
  // }

  bool isloading = false;
  void _isLoadingFalse() {
    isloading = false;
    notifyListeners();
  }

  void dispos(context) {
    jobFormKey.currentState!.reset();
    companyCountry.clear();
    companyName.clear();
    companyPlace.clear();
    companystate.clear();
    jobDesignation.clear();
    jobDiscription.clear();
    minSalary.clear();
    maxSalary.clear();
    minExp.clear();
    maxExp.clear();
    notifyListeners();
  }
}
