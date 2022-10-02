import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_first_trial/models/model.dart';

class NoteTextFeild extends StatefulWidget {
  NoteTextFeild({
    Key? key,
  }) : super(key: key);

  @override
  State<NoteTextFeild> createState() => _NoteTextFeildState();
}

class _NoteTextFeildState extends State<NoteTextFeild> {
  final TextEditingController myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: myController,
      style: const TextStyle(fontSize: 20, color: Colors.white),
      onChanged: (x) {
        // setState(() {});
        Note.typed.value = x;
        // print(typed.value);
      },
      maxLines: 5,
      minLines: 1,
      textInputAction: TextInputAction.newline,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(255, 246, 246, 246).withOpacity(0.07),
        hintText: 'Type note ...',
        hintStyle:
            const TextStyle(color: const Color.fromARGB(255, 255, 254, 255)),
        prefixIcon: const Icon(Icons.note_add,
            color: Color.fromARGB(255, 255, 255, 255)),
        suffixIcon: TextButton(
          child: Obx(() {
            return Note.isLoading.value
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: Color.fromARGB(255, 33, 215, 243),
                    ),
                  )
                : Icon(
                    Icons.send,
                    color: Note.typed.isEmpty
                        ? Colors.grey
                        : const Color.fromARGB(255, 0, 204, 255),
                  );
          }),
          onPressed: () {
            Note.add(myController.text);
            myController.clear();
            // setState(() {});
            FocusScope.of(context).unfocus();
          },
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
      ),
    );
  }
}
