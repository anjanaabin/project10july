import 'dart:convert';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart';
import 'package:untitled17/provider%20user2.dart';

class galaxy extends StatelessWidget{

  // getdetails() async {
  //   Response response= await get(Uri.parse('https://dummyjson.com/user'));
  //   var data = jsonDecode(response.body);
  //   print('data');
  //   return data;
  // }
  @override
  Widget build(BuildContext context) {
    final glx=Provider.of<galaxy1>(context);

    return  Scaffold(
      body: SafeArea(
        child:Column(
          children: [
        FutureBuilder(
        future: glx.getdetails(),
    builder: (context, AsyncSnapshot snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator(),);
      }
      if (snapshot.hasData) {
        return Expanded(

            child: Container(
              child: ListView.builder(
                  itemCount: 100,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      height: 100,
                      width: 300,
                      color: Colors.white,
                      child: SizedBox(
                        height: 100,
                        child: Container(
                          height:150,
                          width: 150,
                          decoration: BoxDecoration(
                            border:Border.all()
                          ),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Row(
                                  children: [
                                    Text(snapshot.data["users"][index]["firstName"].toString()),
                                    Text(snapshot.data["users"][index]["lastName"].toString()),
                                  ],
                                ),
                                Text(snapshot.data["users"][index]["age"].toString()),
                                Text(snapshot.data["users"][index]["bloodGroup"].toString()),


                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(snapshot.data["users"][index]["email"].toString()),
                                    Text(snapshot.data["users"][index]["phone"].toString()),

                                  ],
                                ),
                                // Text(snapshot.data['last name'][index])

                                //Text


                              ]
                          ),
                        ),
                      ),
                    );
                  }
              ),
            )
        );
      }
      return Text("No data");

    }
    )
    ]
    )
    )
    );
    }
  }




