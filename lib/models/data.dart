import 'package:flutter/material.dart';

class Data with ChangeNotifier{

String _data = 'TopLevel DATA 0123456789';

String get getData => _data;

void changeString(String newString){
  
  _data = newString;
  notifyListeners();
}

}