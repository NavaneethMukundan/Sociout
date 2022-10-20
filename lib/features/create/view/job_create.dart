import 'package:flutter/material.dart';
import 'package:sociout/utils/colors.dart';
import 'package:sociout/utils/constraints.dart';
import 'package:sociout/utils/route.dart';

class JobCreate extends StatelessWidget {
  const JobCreate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        elevation: 2,
        toolbarHeight: 70,
        backgroundColor: kWhite,
        leading: IconButton(
            onPressed: () {
              RouteNavigator.popRoute(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: kBlack,
              size: 30,
            )),
        title: const Text(
          'Post Jobs',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: kBlack),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              kheight20,
              const Center(
                child: Text(
                  'Company Details',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              kheight40,
              Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: kWhite, borderRadius: BorderRadius.circular(20)),
                    child: Image.network(
                      'https://static.thenounproject.com/png/396915-200.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  kWidth20,
                  Expanded(
                    child: Column(
                      children: const [
                        TextFormWidget(
                          text: 'Company Name',
                        ),
                        kheight,
                        TextFormWidget(text: 'Place')
                      ],
                    ),
                  )
                ],
              ),
              kheight20,
              Row(
                children: const [
                  Expanded(child: TextFormWidget(text: 'State')),
                  kWidth10,
                  Expanded(child: TextFormWidget(text: 'Country'))
                ],
              ),
              kheight20,
              const Center(
                child: Text(
                  'Job Details',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              kheight20,
              Row(
                children: const [
                  Expanded(child: TextFormWidget(text: 'Job Designation ')),
                  kWidth10,
                  Expanded(child: TextFormWidget(text: 'Job Vacancies ')),
                ],
              ),
              kheight20,
              Row(
                children: const [
                  Expanded(
                    child: RadioButton(text: 'Fresher'),
                  ),
                  Expanded(child: RadioButton(text: 'Experienced'))
                ],
              ),
              kheight,
              Row(
                children: [
                  DropdownButton<String>(
                    elevation: 5,
                    iconEnabledColor: kBlack,
                    hint: const Text(
                      'Choose',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    items: <String>['Full Time', 'Part Time', 'Remote']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  const Text(
                    '₹',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
                  ),
                  kWidth,
                  const Expanded(child: TextFormWidget(text: '')),
                  kWidth10,
                  const Text(
                    'to',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  kWidth10,
                  const Expanded(child: TextFormWidget(text: ''))
                ],
              ),
              kheight20,
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                maxLength: 400,
                decoration: InputDecoration(
                    // contentPadding: const EdgeInsets.only(top: 10),
                    hintText: 'type...',
                    hintStyle: const TextStyle(
                      fontSize: 20,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: kBlack),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: kBlack),
                    )),
              ),
              kheight,
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kBlack,
                      minimumSize: const Size(100, 50)),
                  child: const Text('Post')),
              kheight
            ],
          ),
        ),
      ),
    );
  }
}

class RadioButton extends StatelessWidget {
  const RadioButton({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      title: Text(text),
      value: "male",
      groupValue: "male",
      onChanged: (value) {},
    );
  }
}

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: text,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
    );
  }
}
