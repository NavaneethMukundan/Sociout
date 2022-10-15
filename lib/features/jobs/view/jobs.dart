import 'package:flutter/material.dart';
import 'package:sociout/features/jobs/widgets/random_job.dart';
import 'package:sociout/utils/colors.dart';
import 'package:sociout/utils/constraints.dart';

class JobsPage extends StatelessWidget {
  const JobsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          //contentPadding: const EdgeInsets.all(16),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: kBlack,
                          ),
                          hintText: 'Search...',
                          hintStyle: const TextStyle(color: kBlack),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: kBlack),
                          )),
                    ),
                  ),
                  kWidth10,
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
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Recommended for you',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
