import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sociout/features/jobs/controller/get_saved.dart';
import 'package:sociout/features/jobs/widgets/saved_details.dart';
import 'package:sociout/utils/colors.dart';
import 'package:sociout/utils/constraints.dart';
import 'package:sociout/utils/route.dart';

class SavedJobPage extends StatelessWidget {
  const SavedJobPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SavedJobsController>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kBlack,
          title: const Text('Saved Jobs'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            RouteNavigator.pushRoute(
                                context,
                                SavedDetailsPage(
                                    searchModel: provider.alljobs[index]));
                          },
                          child: SizedBox(
                              height: 200,
                              child: Card(
                                margin: const EdgeInsets.all(13),
                                elevation: 5,
                                color: Colors.white70,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    kheight20,
                                    Row(
                                      children: [
                                        kWidth10,
                                        Expanded(
                                          child: Text(
                                            provider.alljobs[index].designation
                                                .toString(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: kBlack),
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.bookmark_border,
                                              color: Colors.transparent,
                                            ))
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                              " ${provider.alljobs[index].salaryMin.toString()} - ${provider.alljobs[index].salaryMax.toString()} LPA"),
                                        ),
                                        kWidth10,
                                        Container(
                                          height: 25,
                                          width: 80,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: const Color.fromARGB(
                                                  255, 224, 223, 223)),
                                          child: Center(
                                              child: Text(provider
                                                  .alljobs[index].jobType
                                                  .toString())),
                                        )
                                      ],
                                    ),
                                    kheight20,
                                    Row(
                                      children: [
                                        kWidth10,
                                        Container(
                                          height: 55,
                                          width: 55,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: const Color.fromARGB(
                                                  255, 224, 223, 223),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                    provider
                                                        .alljobs[index].image
                                                        .toString(),
                                                  ))),
                                        ),
                                        kWidth10,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 5),
                                              child: Text(
                                                provider.alljobs[index].company
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 5),
                                              child: Text(
                                                provider.alljobs[index].place
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.grey),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Text(
                                          'Posted \n${provider.alljobs[index].createdAt!.day} : ${provider.alljobs[index].createdAt!.month} : ${provider.alljobs[index].createdAt!.year}',
                                          style: const TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        kWidth10,
                                      ],
                                    )
                                  ],
                                ),
                              )),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return kheight;
                      },
                      itemCount: provider.alljobs.length),
                ],
              ),
            ),
          ),
        ));
  }
}
