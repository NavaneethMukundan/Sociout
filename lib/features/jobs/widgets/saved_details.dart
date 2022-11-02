import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sociout/features/jobs/controller/get_saved.dart';
import 'package:sociout/features/jobs/controller/post_save.dart';
import 'package:sociout/features/jobs/model/get_saved_job.dart';
import 'package:sociout/utils/colors.dart';
import 'package:sociout/utils/constraints.dart';
import 'package:sociout/utils/route.dart';

class SavedDetailsPage extends StatelessWidget {
  const SavedDetailsPage({super.key, required this.searchModel});

  final GetSaved searchModel;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<JobSaveController>(context);
    final saveProvider = Provider.of<SavedJobsController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              RouteNavigator.popRoute(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: kBlack,
            )),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kheight20,
              Center(
                child: CircleAvatar(
                    radius: 60,
                    backgroundImage:
                        NetworkImage(searchModel.image.toString())),
              ),
              kheight20,
              Center(
                child: Text(
                  searchModel.designation.toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              kheight,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    '•',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  kWidth10,
                  Expanded(
                    child: Text(
                      searchModel.jobType.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  kWidth20,
                  const Text(
                    '•',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  kWidth10,
                  Expanded(
                    child: Text(
                      searchModel.state.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  kWidth20,
                  const Text(
                    '•',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  kWidth10,
                  Expanded(
                    child: Text(
                      searchModel.jobFor.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 1,
              ),
              kheight20,
              const Text(
                'Company Details',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
              ),
              kheight,
              Row(
                children: [
                  const Text(
                    '•',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  kWidth10,
                  Text(
                    searchModel.company.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 20),
                child: Text(
                  " ${searchModel.place.toString()} , ${searchModel.state.toString()} , ${searchModel.country.toString()}",
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w400),
                ),
              ),
              kheight,
              const Divider(
                thickness: 1,
              ),
              kheight20,
              const Text(
                'Job Requirements',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
              ),
              kheight,
              Row(
                children: [
                  const Text(
                    '•',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  kWidth10,
                  Text(
                    searchModel.jobType.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    '•',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  kWidth10,
                  Text(
                    searchModel.jobFor.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    '•',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  kWidth10,
                  Text(
                    'Salary  ₹ ${searchModel.salaryMin.toString()} - ${searchModel.salaryMax.toString()}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              kheight20,
              const Text(
                'Job Requirements',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
              ),
              kheight20,
              Text(
                searchModel.description.toString(),
                maxLines: 50,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              kheight20,
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        //provider.postSaveButton(context, searchModel);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kBlack,
                          minimumSize: const Size(60, 50)),
                      child: const Icon(Icons.bookmark_border_rounded)),
                  kWidth10,
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kBlack,
                          minimumSize: const Size(280, 50)),
                      child: const Text(
                        'Apply Now',
                        style: TextStyle(fontSize: 17),
                      ))
                ],
              ),
              kheight20,
            ],
          ),
        ),
      )),
    );
  }
}
