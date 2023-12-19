import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travelexperience/utils/image_picker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Uint8List? image;

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: homeBody(),
    );
  }

  Container homeBody() {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  image != null
                      ? CircleAvatar(
                          radius: 80.0,
                          backgroundImage: MemoryImage(image!),
                        )
                      : const CircleAvatar(
                          radius: 80.0,
                          backgroundImage: NetworkImage(
                              'https://cdn1.iconfinder.com/data/icons/user-pictures/100/unknown-512.png'),
                        ),
                  Positioned(
                    bottom: -13,
                    left: 35,
                    child: IconButton(
                      icon: const Icon(Icons.add_a_photo),
                      onPressed: selectImage,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
