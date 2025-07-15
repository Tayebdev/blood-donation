import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyDonate extends StatefulWidget {
  String? text_title;
  String? name;
  MyDonate({super.key, required this.text_title, required this.name});

  @override
  State<MyDonate> createState() => _MyDonateState();
}

class _MyDonateState extends State<MyDonate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 107,
      height: 90,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${widget.text_title}",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          Text("${widget.name}",
              style: TextStyle(fontSize: 14, color: Color(0XFF7C7C7C))),
        ],
      ),
    );
  }
}
