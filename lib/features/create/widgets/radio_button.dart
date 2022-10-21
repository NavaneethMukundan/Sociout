import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sociout/features/create/controller/job_post.dart';
import 'package:sociout/features/create/view/job_create.dart';
import 'package:sociout/utils/constraints.dart';

class RadioButton extends StatelessWidget {
  const RadioButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<JobPostController>(context);
    return Column(
      children: [
        Row(
          // key: provider.jobFormKey,
          children: [
            Expanded(
              child: RadioListTile(
                title: const Text('Fresher'),
                value: "Fresher",
                groupValue: provider.groupValue,
                onChanged: (value) {
                  provider.radioButton('Fresher');
                  provider.displayNewTextfield = false;
                },
              ),
            ),
            kWidth10,
            Expanded(
              child: RadioListTile(
                title: const Text('Experenced'),
                value: "Experenced",
                groupValue: provider.groupValue,
                onChanged: (value) {
                  provider.radioButton('Experenced');
                  provider.displayNewTextfield = true;
                },
              ),
            ),
          ],
        ),
        Visibility(
            visible: provider.displayNewTextfield,
            child: Row(
              children: [
                const SizedBox(
                  width: 150,
                ),
                Expanded(
                    child: SizedBox(
                        height: 70,
                        child: TextFormWidget(
                            validatorErrorMessage: 'Experience is Required',
                            text: '0',
                            controller: provider.minExp))),
                kWidth20,
                const Text(
                  'to',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                kWidth20,
                Expanded(
                    child: SizedBox(
                        height: 70,
                        child: TextFormWidget(
                            validatorErrorMessage: 'Experience is Required',
                            text: '0',
                            controller: provider.maxExp))),
              ],
            ))
      ],
    );
  }
}
