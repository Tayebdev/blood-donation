import 'package:flutter/material.dart';
import 'package:blood/Component/MyText.dart';

// ignore: must_be_immutable
class MyOrderBlood extends StatelessWidget {
  String? number;
  String? type_blood;
  MyOrderBlood({super.key, required this.number, required this.type_blood});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Theme.of(context).primaryColor, width: 1.3),
      ),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            alignment: Alignment.center,
            child: Mytext(
              text: "$type_blood",
              size: 25,
              color: Colors.white,
            ),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(30)),
          ),
          SizedBox(
            width: 15,
          ),
          Mytext(text: "$number", size: 20)
        ],
      ),
    );
  }
}
