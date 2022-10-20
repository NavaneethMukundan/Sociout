import 'package:flutter/material.dart';
import 'package:sociout/features/create/widgets/popup_menu.dart';
import 'package:sociout/utils/colors.dart';

class CreatePage extends StatelessWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhite,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 70,
          backgroundColor: kWhite,
          title: const Center(
            child: Text(
              'Create Post',
              style: TextStyle(
                  fontSize: 35, fontWeight: FontWeight.bold, color: kBlack),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                maxLength: 200,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 10),
                    hintText: 'type...',
                    hintStyle: const TextStyle(
                      fontSize: 20,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: kWhite),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: kWhite),
                    )),
              ),
            ],
          ),
        ),
        floatingActionButton: const PopUpWidgets());
  }
}
