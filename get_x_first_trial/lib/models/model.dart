import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Note {
  final RxString text;
  final RxString title;
  final Color color;
  final RxBool isDone;
  static final RxBool isLoading = false.obs;
  static final RxBool isSaving = false.obs;

  static RxList<Note> notes = <Note>[].obs;
  static RxString typed = ''.obs;

  Note(String text, [bool? isDone])

      ///Set title
      : title = "Note ${notes.length + 1}".obs,
        text = text.obs,
        isDone = (isDone ?? false).obs,
        // isDone = isDone == null ? false.obs : isDone.obs,

        ///Set random color
        color = Colors.accents
            .elementAt(Random().nextInt(Colors.accents.length))
            .shade100;

  makeAsDone() => isDone.value = true;

  // static List<Note> notes = [];

  static add(String note) async {
    isLoading.value = true;
    Note data = Note(note);
    bool success = await Note.sendRequest();
    if (success) {
      notes.add(data);
    } else {
      Get.snackbar(
        "Error",
        "Request failed",
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 4),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    }

    isLoading.value = false;
  }

  static Future<bool> sendRequest() async {
    await Future.delayed(const Duration(seconds: 2));
    if (typed.value.length <= 3) return false;
    return true;
  }

  static clear() {
    notes.clear();
  }

  edit({required String newTitle, required String newText}) async {
    Note.isSaving.value = true;
    await Future.delayed(Duration(seconds: 3));
    title.value = newTitle;
    text.value = newText;
    Note.isSaving.value = false;
    Get.back();
  }
}
