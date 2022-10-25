import 'package:flutter/material.dart';
import 'package:sociout/utils/colors.dart';
import 'package:sociout/utils/constraints.dart';

class RandomJobsWidget extends StatelessWidget {
  const RandomJobsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  const Expanded(
                    child: Text(
                      'Flutter Developer',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kBlack),
                    ),
                  ),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.bookmark_border))
                ],
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(" ₹ 40-90k/Year"),
                  ),
                  kWidth10,
                  Container(
                    height: 25,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromARGB(255, 224, 223, 223)),
                    child: const Center(child: Text('Full - Time')),
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
                        color: const Color.fromARGB(255, 224, 223, 223),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'https://blog.hubspot.com/hubfs/image8-2.jpg',
                            ))),
                  ),
                  kWidth10,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text(
                          'Google',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text(
                          'Bangalore',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Text(
                    '4 days Left',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w500),
                  ),
                  kWidth10,
                ],
              )
            ],
          ),
        ));
  }
}
