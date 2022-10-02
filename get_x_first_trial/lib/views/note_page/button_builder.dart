
import 'package:flutter/material.dart';

import 'note.dart';

class ButtonBuilder extends StatelessWidget {
  const ButtonBuilder({
    Key? key,
    required this.widget,
    required this.titleController,
    required this.textController,
  }) : super(key: key);

  final NotePage widget;
  final TextEditingController titleController;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 40,
      child: ElevatedButton(
          onPressed: () async {
            widget.note.edit(
                newTitle: titleController.text, newText: textController.text);
          },
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              )),
              backgroundColor:
                  MaterialStateProperty.all(Color.fromARGB(255, 0, 204, 255)),
              // padding: MaterialStateProperty.all(
              //     const EdgeInsets.all(10)),
              textStyle: MaterialStateProperty.all(
                  const TextStyle(fontSize: 20, color: Color(0xff040a22)))),
          child: const Text('Save changes')),
    );
  }
}