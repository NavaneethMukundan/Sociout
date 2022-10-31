import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sociout/features/jobs/controller/post_search.dart';
import 'package:sociout/features/jobs/widgets/jobsearchresult.dart';
import 'package:sociout/utils/colors.dart';
import 'package:sociout/utils/route.dart';

class JobSearchPage extends StatelessWidget {
  const JobSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<JobSearchController>(context, listen: false);
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
      ),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return const JobSearchResultWidget();
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
          prefixIcon: const Icon(
            Icons.search,
            color: kBlack,
          ),
          hintText: 'Search...',
          hintStyle: const TextStyle(color: kBlack),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: kBlack),
          )),
      onChanged: (value) {
        provider.jobSearch(context);
      },
    );
  }
}
