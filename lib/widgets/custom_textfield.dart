// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todoapp/constant.dart';
import 'package:todoapp/widgets/custom_text.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      //required this.labelTxt,
      this.prefixIcon,
      required this.hintTxt,
      this.maxLines,
      required this.keyboardType,
   //   required this.heightPro,
   //     required this.widthPro,
      })
      : super(key: key);

  // final String labelTxt;
  final IconData? prefixIcon;
  final String hintTxt;
  final int? maxLines;
  final TextInputType keyboardType;
  //final heightPro  ;
 // final widthPro;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return TextField(
      keyboardType: keyboardType,
      maxLines: maxLines,
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
        hintStyle: const TextStyle(
          fontFamily: 'Open Sans',
        ),
        filled: true,
        fillColor: Style.lightMov,
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.grey[600],
        ),
        // constraints: BoxConstraints.expand(
        //   width: width,
        //   height:height,
        // ),
      ),
    );
  }
}
