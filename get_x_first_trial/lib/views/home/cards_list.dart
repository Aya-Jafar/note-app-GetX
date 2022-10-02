import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_first_trial/models/model.dart';
import 'package:get_x_first_trial/views/home/card.dart';

class CardsList extends StatelessWidget {
  const CardsList({
    Key? key,
  }) : super(key: key);

  static RxInt currentPage = 0.obs;
  static PageController pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return PageView(
          controller: pageViewController,
          onPageChanged: (x) {
            currentPage.value = x;
          },
          children: [
            Note.notes.where((e) => !e.isDone.value).isNotEmpty
                ? ListView(
                    controller: ScrollController(),
                    children: Note.notes
                        .where((e) => !e.isDone.value)
                        .map((e) => MyCard(note: e))
                        .toList())
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.note,
                          size: 70, color: Color.fromARGB(255, 255, 255, 255)),
                      SizedBox(
                        height: 10,
                      ),
                      Text('No tasks has been added yet :(',
                          style: TextStyle(color: Colors.white, fontSize: 20))
                    ],
                  ),
            Note.notes.where((e) => e.isDone.value).isNotEmpty
                ? ListView(
                    controller: ScrollController(),
                    children: Note.notes
                        .where((e) => e.isDone.value)
                        .map((e) => MyCard(note: e))
                        .toList())
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.note,
                          size: 70, color: Color.fromARGB(255, 255, 255, 255)),
                      SizedBox(
                        height: 10,
                      ),
                      Text('No completed tasks has been added yet :(',
                          style: TextStyle(color: Colors.white, fontSize: 20))
                    ],
                  ),
          ]);
    });
  }
}
