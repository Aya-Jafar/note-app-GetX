import 'package:flutter/material.dart';
import 'package:get_x_first_trial/views/note_page/note.dart';

import '../../models/model.dart';
import 'package:get/get.dart';

class MyCard extends StatelessWidget {
  const MyCard({Key? key, required this.note}) : super(key: key);

  final Note note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        Get.to(() => NotePage(
              note: note,
            ));
      },
      child: Container(
        width: double.maxFinite,
        margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
        decoration: BoxDecoration(
            color: note.color, borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          children: [
            Obx(() {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    note.title.value,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(236, 4, 10, 34),
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    note.text.value,
                    style: const TextStyle(fontSize: 16, color: Colors.black54),
                  )
                ],
              );
            }),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.done),
              onPressed: () {
                note.makeAsDone();
              },
            )
          ],
        ),
      ),
    );
  }
}
