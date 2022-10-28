import 'package:flutter/material.dart';
import 'package:sociout/utils/colors.dart';
import 'package:sociout/utils/constraints.dart';

class JobSearchPage extends StatelessWidget {
  const JobSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    backgroundColor: kBlack, minimumSize: const Size(50, 50)),
                child: const Icon(
                  Icons.filter_list,
                  color: kWhite,
                ))
          ],
        ),
      ],
    );
  }
}
