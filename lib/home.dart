

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled17/home2.dart';

class home extends StatefulWidget {


  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
int cntindex=0;
late PageController page;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    page=PageController(initialPage:cntindex);

}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: PageView(
        controller:page,
        children: [
          chat(),
          video(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: cntindex,
       onTap: (int index){
          setState((){
            cntindex=index;
            page.jumpToPage(index);

          });
       },
       items: [
         BottomNavigationBarItem(icon:Icon(Icons.home),label: ""),
         BottomNavigationBarItem(icon: Icon(Icons.chat),label: ""),
       ],
      ),
      drawer:Drawer(
        child: ListView(
          children: [
            Container(
              height: 100,
              child: DrawerHeader(child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Gmail') ,
                  Divider()

                ],
              ),),
            ),
            ListTile(leading: Icon(Icons.bookmark),title: Text('book mark'),),
            ListTile(leading:Icon(Icons.people),title: Text('people'),),
            Text('All labels'),
            ListTile(leading: Icon(Icons.star),title: Text('star'),),
            ListTile(leading:Icon(Icons.send),title:Text('send'), ),
            ListTile(leading:Icon(Icons.outbox),title:Text('outbox'), ),
            ListTile(leading:Icon(Icons.delete),title:Text('delete'), ),
            ListTile(leading:Icon(Icons.drafts),title:Text('drafts'), ),
            ListTile(leading:Icon(Icons.timer),title:Text('Timer'),),
            ListTile(leading:Icon(Icons.mail),title:Text('mail'),),
            ListTile(leading: Icon(Icons.schedule_send),title: Text('schedule'),),
              Text('Google apps'),
            ListTile(leading: Icon(Icons.calendar_month),title:Text('calendar'),),
            ListTile(leading: Icon(Icons.contacts),title:Text('contacts'),),
              Divider(),
            ListTile(leading: Icon(Icons.settings),title:Text('settings'),),
            ListTile(leading: Icon(Icons.help),title:Text('help'),onTap: (){}, ),

          ],
        ),
      ) ,


    );
  }
}

