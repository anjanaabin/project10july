import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled17/pic.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController namecontroller=TextEditingController();
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController phonenumbercontroller=TextEditingController();
CollectionReference details=FirebaseFirestore.instance.collection('details');
  String n='';
  String e='';
  String p='';
  File?Imagepath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my world'),
      ),
      body: ListView(
        children:[

          Padding(
            padding: const EdgeInsets.all(5.0),
            child: InkWell(onTap: ()async{
              var image=await ImagePicker().pickImage(source: ImageSource.gallery);
              setState(() {
                Imagepath=File(image!.path);
              });
            },
              child:Imagepath==null? CircleAvatar(
                child: Icon(Icons.image),
                radius: 60,
              ):Image(image: FileImage(Imagepath!),height: 150,width: 150,)
            ),
          ),
        SizedBox(
          height: 10,
        ),

        Container(
          height: 100,
           child :TextFormField(
             validator: (value){
               if(value!.isEmpty){
                 return 'enter value';
               }return null;
             },
             onChanged: (value){
               n=value;
             },
       decoration: InputDecoration(
         icon: Icon(Icons.abc),
         labelText: ('name'),
         border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(20),
         ),
       ),
          ),
          ),
         Container(
           height: 100,
           child :TextFormField(
             validator: (value){
    if(value!.isEmpty) {
      return 'enter value';
    }return  null;
             },
             onChanged: (value){
               e=value;
             },
             decoration: InputDecoration(
               icon: Icon(Icons.email),
               labelText: ('email'),
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(20),
               ),
             ),
           ),
         ),
         Container(
           height: 100,
           child :TextFormField(
             validator: (value){
               if(value!.isEmpty){
                 return "enter value";
               }
               return null;

             },
             onChanged: (value){
               p=value;
             },
             decoration: InputDecoration(
               icon: Icon(Icons.phone),
               labelText: ('phone number'),
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(20),
               ),
             ),
           ),
         ),
          Imagepath==null?Container():
          ElevatedButton(onPressed: ()async{
             var ref= await FirebaseStorage.instance.ref().child('images/${Imagepath!.path}');
            await ref.putFile(Imagepath!);
            print("succes");


          }, child:Text('upload'),
          ),
          ElevatedButton(onPressed: (){
            details.add({
              "Name": n,
              "phonenumber":p,
              "email":e,
            }).then((value) {
              return "ok";
            });
          }, child:Text('add'),),

        ],

          ),

    );
  }
}
