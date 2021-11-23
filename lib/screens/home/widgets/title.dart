import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: Divider(
            color: Colors.black45,
          ),
        ),
        SizedBox(width: 20),
        Text("Rx ToDo",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
        SizedBox(width: 20),
        Expanded(
          child: Divider(
            color: Colors.black45,
          ),
        ),
      ],
    );
  }
}


