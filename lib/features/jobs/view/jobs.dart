import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sociout/features/jobs/controller/posted_job.dart';
import 'package:sociout/features/jobs/view/job_search.dart';
import 'package:sociout/features/jobs/view/posted_jobs.dart';
import 'package:sociout/features/jobs/widgets/random_job.dart';
import 'package:sociout/utils/colors.dart';
import 'package:sociout/utils/constraints.dart';
import 'package:sociout/utils/route.dart';

class JobsPage extends StatelessWidget {
  const JobsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PostedJobsController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 80,
        title: const Center(
          child: Text(
            'Jobs',
            style: TextStyle(
                fontSize: 35, fontWeight: FontWeight.bold, color: kBlack),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      RouteNavigator.pushRoute(context, const JobSearchPage());
                    },
                    child: Container(
                      height: 60,
                      width: 280,
                      decoration: BoxDecoration(
                          color: kWhite,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: kBlack)),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 12, top: 20),
                        child: Text(
                          'Search',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kBlack,
                          minimumSize: const Size(50, 50)),
                      child: const Icon(
                        Icons.filter_list,
                        color: kWhite,
                      ))
                ],
              ),
              kheight20,
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    const Text(
                      'Recommended for you',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed: () async {
                          await provider.getAllJobs(context).then((value) => {
                                RouteNavigator.pushRoute(
                                    context, const ViewPostedJobs())
                              });
                        },
                        child: const Text(
                          'Your Jobs ->',
                          style: TextStyle(color: kBlack),
                        ))
                  ],
                ),
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return const RandomJobsWidget();
                  },
                  separatorBuilder: (context, index) {
                    return kheight;
                  },
                  itemCount: 10),
            ],
          ),
        ),
      ),
    );
  }
}
