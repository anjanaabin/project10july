import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class galaxy1 extends ChangeNotifier{
  var _data;
  get data => _data;

  getdetails() async {
    Response response= await get(Uri.parse('https://dummyjson.com/user'));
     _data = jsonDecode(response.body);
    print('data');
    return _data;
  }

}