import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerDemo extends StatefulWidget {
  const ImagePickerDemo({super.key});

  @override
  State<ImagePickerDemo> createState() => _ImagePickerDemoState();
}

class _ImagePickerDemoState extends State<ImagePickerDemo> {
  final ImagePicker _pick = ImagePicker();
  String? _image;

  Future<void> imagePickerFromDevice() async {
    XFile? data = await _pick.pickImage(source: ImageSource.gallery);
    if (data != null) {
      setState(() {
        _image = data.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image_picker"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 88, 154, 220),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                imagePickerFromDevice();
              },
              child: Container(
                width: 200,
                height: 200,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.amber),
                child: _image != null
                    ? Image.file(File(_image!), fit: BoxFit.cover)
                    : Image.asset(
                        "assets/images/player_logo.png",
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
