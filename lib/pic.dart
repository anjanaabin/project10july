

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class images extends StatefulWidget {
  const images({Key? key}) : super(key: key);

  @override
  State<images> createState() => _imagesState();
}
File?Imagepath;
class _imagesState extends State<images> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: ()async{
                var image= await ImagePicker().pickImage(source: ImageSource.gallery);
                setState(() {
                  Imagepath=File(image!.path);
                });
              }, child:Text('images')),
              Imagepath==null?Container():Image(image: FileImage(Imagepath!),height:150 ,width: 150,),
              Imagepath==null?Container():ElevatedButton(onPressed: ()async{
                var ref= await FirebaseStorage.instance.ref().child('images/${Imagepath!.path}');
                await ref.putFile(Imagepath!);
               var url = await ref.getDownloadURL();
               print(url);
                print("succes");


              }, child:Text('upload'))
            ],
          ),
        ),
      ),
    );
  }
}
