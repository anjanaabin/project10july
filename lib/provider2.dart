import 'package:flutter/foundation.dart';

class counter extends ChangeNotifier{
  int _counter=0;
  int get cnt => _counter;

  increment(){

    _counter++;
    notifyListeners();

  }

}