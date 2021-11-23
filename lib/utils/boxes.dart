import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:roarx_todo/model/list_data.dart';

class MyBox {
  static String boxName = "cards_List";

  static Box<ListData> get box => Hive.box<ListData>(boxName);
}

class CrudOperation {
  static void addData(String name, Color cardColor) {
    final ListData data =
        ListData(todos: [], listTitle: name, color: cardColor);

    final Box<ListData> box = MyBox.box;

    try {
      box.add(data);
    } catch (e) {
      print(e);
    }
  }
}
