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
            backgroundColor: MaterialStateProperty.all(widget.note.color),
          ),
          child: const Text(
            'Save changes',
            style: TextStyle(fontSize: 20, color: Color(0xff040a22)),
          )),
    );
  }
}
