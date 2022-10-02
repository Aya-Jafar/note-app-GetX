
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar appBarBuilder() {
  return AppBar(
      backgroundColor: const Color(0xff040a22),
      leading: Container(
        margin: EdgeInsets.only(left: 10),
        child: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onTap: () {
            Get.back();
          },
        ),
      ));
}