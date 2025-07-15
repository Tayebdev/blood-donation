import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Button_ extends StatelessWidget {
  String? name;
  String? image;
  Function()? function;
  Button_(
      {super.key,
      required this.name,
      required this.image,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        height: 111,
        width: 111,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("$image"),
            TextButton(
                onPressed: function,
                child: Text(
                  "$name",
                  style: TextStyle(fontSize: 14, color: Color(0XFF7E7E7E)),
                ))
          ],
        ));
  }
}
