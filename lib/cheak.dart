import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class checkbox extends StatefulWidget {
  const checkbox({Key? key}) : super(key: key);

  @override
  State<checkbox> createState() => _checkboxState();
}

class _checkboxState extends State<checkbox> {
  bool ischecked=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Center(
              child: CheckboxMenuButton(
                child: Text('checkbox'),
                value: ischecked,
                onChanged: (value){
                  setState(() {
                    ischecked;value;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
