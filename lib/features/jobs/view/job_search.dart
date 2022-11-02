import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sociout/features/jobs/controller/post_save.dart';
import 'package:sociout/features/jobs/controller/post_search.dart';
import 'package:sociout/features/jobs/widgets/search_full_view.dart';
import 'package:sociout/utils/colors.dart';
import 'package:sociout/utils/constraints.dart';
import 'package:sociout/utils/route.dart';

class JobSearchPage extends StatelessWidget {
  const JobSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<JobSearchController>(context);
    final saveProvider = Provider.of<JobSaveController>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              RouteNavigator.popRoute(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: kBlack,
            )),
        title: const Textwidget(),
        actions: [
          IconButton(
              onPressed: () {
                provider.jobSearch(context);
              },
              icon: const Icon(
                Icons.search,
                color: kBlack,
              ))
        ],
      ),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      RouteNavigator.pushRoute(
                          context,
                          SearchDetailView(
                              searchModel: provider.searchResponse[index]));
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
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Text(
                                        provider
                                            .searchResponse[index].designation
                                            .toString(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: kBlack),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        // saveProvider.postSaveButton(
                                        //     context);
                                      },
                                      icon: const Icon(Icons.bookmark_border))
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(
                                      "${provider.searchResponse[index].salaryMin.toString()} - ${provider.searchResponse[index].salaryMax.toString()} LPA",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  kWidth10,
                                  Container(
                                    height: 25,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: const Color.fromARGB(
                                            255, 224, 223, 223)),
                                    child: Center(
                                        child: Text(provider
                                            .searchResponse[index].jobType
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
                                        borderRadius: BorderRadius.circular(5),
                                        color: const Color.fromARGB(
                                            255, 224, 223, 223),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              provider
                                                  .searchResponse[index].image
                                                  .toString(),
                                            ))),
                                  ),
                                  kWidth10,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          provider.searchResponse[index].company
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          provider.searchResponse[index].place
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
                                  // Text(
                                  //   provider.searchResponse[index].createdAt
                                  //       .toString(),
                                  //   maxLines: 2,
                                  //   overflow: TextOverflow.ellipsis,
                                  //   style: const TextStyle(
                                  //       color: Colors.red,
                                  //       fontWeight: FontWeight.w500),
                                  // ),
                                  kWidth10,
                                ],
                              )
                            ],
                          ),
                        )),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: provider.searchResponse.length,
              ))),
    );
  }
}

class Textwidget extends StatelessWidget {
  const Textwidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<JobSearchController>(context, listen: false);
    return TextFormField(
      controller: provider.searchController,
      decoration: InputDecoration(
          //contentPadding: const EdgeInsets.all(16),
          // prefixIcon: const Icon(
          //   Icons.search,
          //   color: kBlack,
          // ),
          hintText: 'Search...',
          hintStyle: const TextStyle(color: kBlack),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: kBlack),
          )),
    );
  }
}
