// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todoapp/constant.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    //required this.labelTxt,
    this.prefixIcon,
    required this.hintTxt,
    this.maxLines,
    required this.keyboardType,
    //   required this.heightPro,
    //     required this.widthPro,
    required this.txtEditingController,
    required this.cursorColor,
  }) : super(key: key);

  // final String labelTxt;
  final IconData? prefixIcon;
  final String hintTxt;
  final int? maxLines;
  final TextInputType keyboardType;
  final Color cursorColor;
  //final heightPro  ;
  // final widthPro;
  TextEditingController txtEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: txtEditingController,
      keyboardType: keyboardType,
      maxLines: maxLines,
      cursorColor: cursorColor,
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Style.lightMov),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Style.lightMov),
          borderRadius: BorderRadius.circular(15),
        ),
        hintText: hintTxt,
        hintStyle: TextStyle(
          fontFamily: 'Open Sans',
          color: Colors.grey.shade600,
        ),
        filled: true,
        fillColor: Style.lightMov,
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.grey[600],
        ),
      ),
      showCursor: true,
    );
  }
}
