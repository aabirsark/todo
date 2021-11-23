import 'package:flutter/material.dart';
import 'package:roarx_todo/screens/home/widgets/add_data.dart';
import 'package:roarx_todo/screens/home/widgets/cards.dart';
import 'package:roarx_todo/screens/home/widgets/title.dart';
import 'package:roarx_todo/utils/color_picker_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: const CustomFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
         const SizedBox(
            height: 30,
          ),
         const HomeTitle(),
          const SizedBox(
            height: 30,
          ),
         const  Expanded(child: TodoCards()),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
        ]),
      ),
    );
  }
}

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => const AddNewList(),
        );
      },
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.redAccent),

          // color: Colors.pink,
        ),
        child: const Center(
          child: Text("Add",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.redAccent)),
        ),
      ),
    );
  }
}
