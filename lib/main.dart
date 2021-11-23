import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:roarx_todo/model/list_data.dart';

import 'package:roarx_todo/screens/home/home.dart';
import 'package:roarx_todo/utils/boxes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // hive db init
  await Hive.initFlutter();
  Hive.registerAdapter<ListData>(ListDataAdapter());
  Hive.registerAdapter<TodoStructure>(TodoStructureAdapter());

  await Hive.openBox<ListData>(MyBox.boxName);

  runApp(const RxTodo());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class RxTodo extends StatelessWidget {
  const RxTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Roarx To-do",
        theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.red,
            primaryColor: Colors.red,
            fontFamily: GoogleFonts.nunito().fontFamily),
        home: const HomeScreen());
  }
}
