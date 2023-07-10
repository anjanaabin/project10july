import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled17/provider2.dart';

class constracter extends StatelessWidget {
  const constracter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    final cnt=Provider.of<counter>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: cnt.increment(),),
      body: SafeArea(
        child: Column(
          children: [
            Text('count'),
            Text(cnt.cnt.toString()),
          ],
        ),
      ),
    );
  }
}
