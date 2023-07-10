import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class chat extends StatelessWidget {
  const chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount:10,itemBuilder:(BuildContext context,int index){
      return
          ListTile(leading:CircleAvatar(child: Text('abc'),),);
    });
  }
}
class video extends StatelessWidget {
  const video({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Padding(
      padding: const EdgeInsets.all(9.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                child:
              Text('Meet'),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 50,
                width: 150,

decoration: BoxDecoration(
  border: Border.all(),

),
                child: Text('new metting'),
    ),
    SizedBox(
      height: 30,
    ),
    Container(
    height: 50,
    width: 150,

    decoration: BoxDecoration(
    border: Border.all(),

    ),
    child: Text('join'),




    ),
    ],
          ),
        ],
      ),
    );
  }
}