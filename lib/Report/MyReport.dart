import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyReport extends StatelessWidget {
  String? volume;
  String? value;
  String? type;
  MyReport(
      {super.key,
      required this.value,
      required this.volume,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 116,
      height: 87,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${value} ",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Text("${volume}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          Text("${type}",
              style: TextStyle(fontSize: 16, color: Color(0XFF7C7C7C))),
        ],
      ),
    );
  }
}
