import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sociout/features/create/model/job_post.dart';
import 'package:sociout/features/jobs/model/post_save.dart';
import 'package:sociout/features/jobs/model/post_save_response.dart';
import 'package:sociout/features/jobs/services/post_save_servies.dart';
import 'package:sociout/features/jobs/view/jobs_ave.dart';
import 'package:sociout/services/connection_check.dart';
import 'package:sociout/utils/route.dart';
import 'package:sociout/utils/snackbar.dart';

class JobSaveController extends ChangeNotifier {
  bool isLoading = false;
  JobPostModel? jobPostModel;

  Future<void> postSaveButton(context) async {
    if (await connectionCheck()) {
      isLoading = true;

      final obj = JobSaveModel();

      JobSaveResponseModel? jobsave =
          await JobSaveServices().saveServices(obj, context);

      if (jobsave == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('No Response.....'));
        isLoadingFalse();
        return;
      } else if (jobsave.saved == true) {
        log('Save Done');
        RouteNavigator.pushRoute(context, const SavedJobPage());
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('Job added to List'));
        isLoadingFalse();
        return;
      } else if (jobsave.saved == false) {
        log('UnSave Done');
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('Job removed from List'));
        isLoadingFalse();
        return;
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('Something went wrong'));
        isLoadingFalse();
        return;
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(ShowDialogs.popUp('Please check interent connection'));
    }
  }

  void isLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }
}