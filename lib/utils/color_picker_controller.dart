import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorPickerController with ChangeNotifier {
  // value
  Color _color = Colors.blueAccent;

  // getter
  Color get color => _color;

  //setter
  void setColor(Color color) {
    _color = color;
    notifyListeners();
  }
}
