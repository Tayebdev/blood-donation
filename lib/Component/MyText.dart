import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Mytext extends StatelessWidget {
  String? text;
  double? size;
  FontWeight? fontWeight;
  Color? color;
  Mytext(
      {super.key,
      required this.text,
      required this.size,
      this.fontWeight,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      style: TextStyle(fontSize: size, fontWeight: fontWeight, color: color),
    );
  }
}
