import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sociout/utils/colors.dart';

class ImageObtainWidget extends StatelessWidget {
         ImageObtainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return Container(
                    height: 100,
                    color: kWhite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              getImageFromCamera();
                            },
                            style: ElevatedButton.styleFrom(
                                elevation: 0, backgroundColor: Colors.white),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.camera_alt_outlined,
                                  color: kBlack,
                                  size: 40,
                                ),
                                Text(
                                  'Camera',
                                  style: TextStyle(
                                    color: kBlack,
                                  ),
                                )
                              ],
                            )),
                        const SizedBox(
                          width: 80,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              getImageFromGallery();
                            },
                            style: ElevatedButton.styleFrom(
                                elevation: 0, backgroundColor: Colors.white),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.image,
                                  color: kBlack,
                                  size: 40,
                                ),
                                Text(
                                  'Gallery',
                                  style: TextStyle(
                                    color: kBlack,
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                  );
                });
          },
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                color: kWhite, borderRadius: BorderRadius.circular(20)),
            child: Image.network(
              'https://static.thenounproject.com/png/396915-200.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  String newImage = "";
  getImageFromGallery() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    final bytes = File(pickedFile!.path).readAsBytesSync();
    newImage = base64Encode(bytes);
    //notifyListeners();
  }

  String cameraImage = '';
  getImageFromCamera() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    final bytes = File(pickedFile!.path).readAsBytesSync();
    cameraImage = base64Encode(bytes);
    //notifyListeners();
  }
}
