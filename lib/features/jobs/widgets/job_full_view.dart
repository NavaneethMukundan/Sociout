import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sociout/features/jobs/model/posted_job.dart';
import 'package:sociout/utils/colors.dart';
import 'package:sociout/utils/constraints.dart';
import 'package:sociout/utils/route.dart';

class JobDetailsPage extends StatelessWidget {
  const JobDetailsPage({super.key, required this.jobModel});

  final Postedjobsmodel jobModel;

  @override
  Widget build(BuildContext context) {
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
                  backgroundImage: MemoryImage(
                      const Base64Decoder().convert(jobModel.image.toString())),
                ),
              ),
              kheight20,
              Center(
                child: Text(
                  jobModel.designation.toString(),
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
                      jobModel.jobType.toString(),
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
                      jobModel.state.toString(),
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
                      jobModel.jobFor.toString(),
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
                    jobModel.company.toString(),
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
                  " ${jobModel.place.toString()} , ${jobModel.state.toString()} , ${jobModel.country.toString()}",
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
                    jobModel.jobType.toString(),
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
                    jobModel.jobFor.toString(),
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
                    'Salary  ₹ ${jobModel.salaryMin.toString()} - ${jobModel.salaryMax.toString()}',
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
                jobModel.description.toString(),
                maxLines: 50,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              kheight20,
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {},
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
