import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  XFile? pickedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: ListView(
        children: [
          Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: () async {
                pickedImage = await ImagePicker()
                    .pickImage(source: ImageSource.camera, imageQuality: 40);
                setState(() {});
              },
              child: pickedImage == null
                  ? Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: const Icon(Icons.person_2),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: Image.file(
                        File(pickedImage!.path),
                        width: 70,
                        height: 70,
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
