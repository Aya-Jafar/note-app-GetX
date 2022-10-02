import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/model.dart';
import 'appbar.dart';
import 'button_builder.dart';
import 'edit_text_field.dart';


class NotePage extends StatefulWidget {
  final Note note;
  const NotePage({Key? key, required this.note}) : super(key: key);

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    titleController.text = widget.note.title.value;
    textController.text = widget.note.text.value;
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff040a22),
      appBar: appBarBuilder(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldBuilder(
              controller: titleController,
              hintText: 'New title',
            ),
            const SizedBox(
              height: 30,
            ),
            TextFieldBuilder(
              controller: textController,
              hintText: 'New text',
            ),
            const SizedBox(
              height: 30,
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: Obx(() {
                return (!Note.isSaving.value)
                    ? ButtonBuilder(
                        widget: widget,
                        titleController: titleController,
                        textController: textController)
                    : const CircularProgressIndicator();
              }),
            )
          ],
        ),
      ),
    );
  }
}
