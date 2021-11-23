import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:roarx_todo/model/list_data.dart';

import 'package:roarx_todo/screens/detail/detail.dart';
import 'package:roarx_todo/utils/boxes.dart';

class TodoCards extends StatelessWidget {
  const TodoCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<ListData>>(
      valueListenable: MyBox.box.listenable(),
      builder: (context, value, child) {
        List<ListData> data = value.values.cast<ListData>().toList();
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (context, index) {
            var cardData = data.elementAt(index);
            return Dismissible(
              direction: DismissDirection.up,
              key: Key(cardData.key.toString()),
              onDismissed: (_) {
                cardData.delete();
              },
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Detail(
                          index: index,
                          title: cardData.listTitle ?? "",
                          colorTheme: cardData.color,
                          cardData: cardData,
                        ),
                      ));
                },
                child: Container(
                  height: 320,
                  width: 220,
                  margin: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        cardData.listTitle ?? "",
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            letterSpacing: 1.5,
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text(
                        cardData.todos.length.toString(),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        style: const TextStyle(
                          letterSpacing: 1.5,
                          color: Colors.white,
                          fontSize: 100,
                        ),
                      ),
                      const Text(
                        "Tasks Left",
                        style: TextStyle(
                          letterSpacing: 1.5,
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                      const Spacer()
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: cardData.color,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
