import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_first_trial/views/home/cards_list.dart';

class NavigatorButtons extends StatelessWidget {
  const NavigatorButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 60,),
        Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: TextButton(onPressed: () {
              CardsList.pageViewController.animateToPage(0,
                  duration: Duration(milliseconds: 300), curve: Curves.linear);
            }, child: Obx(() {
              return Text(
                'All Tasks',
                style: TextStyle(
                    fontSize: 17,
                    color: CardsList.currentPage.value == 0
                        ? Color.fromARGB(255, 255, 35, 108)
                        : Colors.white,
                    fontWeight: CardsList.currentPage.value == 0
                        ? FontWeight.bold
                        : FontWeight.normal),
              );
            }))),
        SizedBox(
          width: 5,
        ),
        Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: TextButton(onPressed: () {
              CardsList.pageViewController.animateToPage(1,
                  duration: Duration(milliseconds: 300), curve: Curves.linear);
            }, child: Obx(() {
              return Text('Completed Tasks',
                  style: TextStyle(
                      fontSize: 17,
                      color: CardsList.currentPage.value == 1
                          ? Color.fromARGB(255, 255, 35, 108)
                          : Colors.white,
                      fontWeight: CardsList.currentPage.value == 1
                          ? FontWeight.bold
                          : FontWeight.normal));
            }))),
      ],
    );
  }
}
