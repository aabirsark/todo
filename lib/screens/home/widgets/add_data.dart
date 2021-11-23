import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roarx_todo/utils/boxes.dart';
import 'package:roarx_todo/utils/color_picker_controller.dart';

class AddNewList extends StatefulWidget {
  const AddNewList({Key? key}) : super(key: key);

  @override
  State<AddNewList> createState() => _AddNewListState();
}

class _AddNewListState extends State<AddNewList> {
  late final TextEditingController _textEditingController;
  late final ColorPickerController _colorPickerController;

  @override
  void initState() {
    _textEditingController = TextEditingController();

    _colorPickerController = ColorPickerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewInsets = MediaQuery.of(context).viewInsets.bottom;
    final safeAreaBottom = MediaQuery.of(context).padding.bottom;
    return Container(
      padding: EdgeInsets.only(
          top: 18.0,
          left: 18.0,
          right: 18.0,
          bottom: 18.0 + viewInsets + safeAreaBottom),
      // height: 300,
      child: Column(
        verticalDirection: VerticalDirection.up,
        children: [
          // const SizedBox(
          //   height: 20,
          // ),
          InputRow(
              textEditingController: _textEditingController,
              colorPickerController: _colorPickerController),
          const SizedBox(
            height: 10,
          ),
          ColorPicker(colorPickerController: _colorPickerController),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 60,
            width: 60,
            child: Center(
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(CupertinoIcons.multiply, size: 30)),
            ),
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
          )
        ],
      ),
    );
  }
}

class ColorPicker extends StatefulWidget {
  const ColorPicker({
    Key? key,
    required this.colorPickerController,
  }) : super(key: key);

  final ColorPickerController colorPickerController;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Colors.redAccent,
      Colors.grey,
      Colors.green,
      Colors.amber,
      Colors.pink,
      Colors.indigoAccent,
      Colors.purple,
      Colors.teal,
      Colors.orange,
      Colors.blueAccent,
      Colors.cyan,
      Colors.brown
    ];

    return Container(
      height: 100,
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          Color currentColor = colors.elementAt(index);
          return Padding(
              padding: const EdgeInsets.all(3.0),
              child: InkWell(
                onTap: () {
                  widget.colorPickerController.setColor(currentColor);
                  setState(() {});
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: widget.colorPickerController.color == currentColor
                        ? Border.all(color: Colors.black)
                        : Border.all(color: currentColor),
                    color: currentColor,
                  ),
                ),
              ));
        },
        itemCount: colors.length,
      ),
    );
  }
}

class InputRow extends StatelessWidget {
  const InputRow(
      {Key? key,
      required this.textEditingController,
      required this.colorPickerController})
      : super(key: key);

  final TextEditingController textEditingController;
  final ColorPickerController colorPickerController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            height: 60,
            width: MediaQuery.of(context).size.width * 0.68,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: TextFormField(
                textAlign: TextAlign.center,
                controller: textEditingController,
                decoration: const InputDecoration(
                    hintText: "Type list Name", border: InputBorder.none),
              ),
            )),
        // SizedBox(width: 5),
        Container(
          height: 60,
          width: MediaQuery.of(context).size.width * 0.2,
          child: Center(
            child: IconButton(
                onPressed: () {
                  if (textEditingController.text != "") {
                    CrudOperation.addData(textEditingController.text,
                        colorPickerController.color);
                    Navigator.pop(context);
                  }
                },
                icon: const Icon(Icons.done, size: 30)),
          ),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
        )
      ],
    );
  }
}
