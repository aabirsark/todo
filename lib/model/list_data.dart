import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'list_data.g.dart';

@HiveType(typeId: 0)
class ListData extends HiveObject {
  /// Title of Card
  @HiveField(0)
  String? listTitle;

  /// Color of the Card;
  @HiveField(1)
  Color color;

  /// List of todos
  @HiveField(2)
  List<TodoStructure> todos;

  // constructor
  ListData(
      {this.listTitle, this.color = Colors.blueAccent, required this.todos});
}

@HiveType(typeId: 1)
class TodoStructure {
  TodoStructure({required this.title, bool completed = false})
      : statusCompleted = completed;

  @HiveField(0)
  String title;

  @HiveField(1)
  bool statusCompleted = false;
}
