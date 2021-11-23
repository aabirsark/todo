import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:roarx_todo/model/list_data.dart';
import 'package:roarx_todo/screens/detail/widgets/header.dart';
import 'package:roarx_todo/utils/boxes.dart';

class Detail extends StatefulWidget {
  const Detail(
      {Key? key,
      required this.title,
      required this.colorTheme,
      required this.cardData,
      required this.index})
      : super(key: key);

  final String title;
  final Color colorTheme;
  final ListData cardData;
  final int index;

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    List<TodoStructure> list = widget.cardData.todos;

    void addData(String title) {
      TodoStructure data = TodoStructure(title: title);
      list.add(data);
      // setState(() {
      //   list.add(data);
      // });
      widget.cardData
        ..todos = list
        ..save();
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: widget.colorTheme,
        ),
        child: Center(
            child: IconButton(
          icon: const Icon(CupertinoIcons.add, size: 30),
          color: Colors.white,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) => AddTodos(
                onPress: addData,
              ),
            );
          },
        )),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 40.0),
        child: Column(
          children: [
            DetailPageHeader(title: widget.title, color: widget.colorTheme),
            Expanded(
                child: ValueListenableBuilder<Box<ListData>>(
                    valueListenable: MyBox.box.listenable(),
                    builder: (context, value, child) {
                      List<TodoStructure> dbData = value.values
                          .cast<ListData>()
                          .toList()
                          .elementAt(widget.index)
                          .todos;
                      return ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        separatorBuilder: (context, index) {
                          return Divider(
                            color: widget.colorTheme.withOpacity(0.3),
                          );
                        },
                        itemBuilder: (context, index) {
                          var currData = dbData.elementAt(index);
                          return ListTile(
                              title: Text(
                                currData.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 18),
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    list.removeAt(index);
                                    widget.cardData
                                      ..todos = list
                                      ..save();
                                  },
                                  icon: Icon(
                                    Icons.done,
                                    color: widget.colorTheme,
                                  )),
                              leading: Text("${index + 1}."));
                        },
                        itemCount: dbData.length,
                      );
                    }))
          ],
        ),
      ),
    );
  }
}

class AddTodos extends StatelessWidget {
  const AddTodos({Key? key, required this.onPress}) : super(key: key);

  final void Function(String) onPress;

  @override
  Widget build(BuildContext context) {
    final TextEditingController _editingController = TextEditingController();
    final viewInsets = MediaQuery.of(context).viewInsets.bottom;
    final safeAreaBottom = MediaQuery.of(context).padding.bottom;
    return Padding(
      padding: EdgeInsets.only(
          top: 18.0,
          left: 18.0,
          bottom: 18.0 + viewInsets + safeAreaBottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width * 0.2,
            child: Center(
              child: IconButton(
                  onPressed: () {
                    if (_editingController.text != "") {
                      onPress(_editingController.text);
                      _editingController.clear();
                    }
                  },
                  icon: const Icon(Icons.done, size: 30)),
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Center(
              child: TextFormField(
                controller: _editingController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    hintText: "Type list Name", border: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
