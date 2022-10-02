import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_x_first_trial/views/home/cards_list.dart';
import 'package:get_x_first_trial/views/home/text_field.dart';
import '../../models/model.dart';
import './navigators.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.all(20.0),
          margin: EdgeInsets.only(top: 10, left: 15),
          child: Text(
            'My Notes'.toUpperCase(),
            style: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255), fontSize: 22),
          ),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Color(0xff040a22),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              NoteTextFeild(),
              NavigatorButtons(),
              const Expanded(
                child: CardsList(),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 0, 204, 255),
        onPressed: () {
          Note.clear();
          // setState(() {});
        },
        child: const Icon(Icons.delete),
      ),
    );
  }
}
