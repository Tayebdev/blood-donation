import 'package:flutter/material.dart';
import 'package:blood/Component/MyText.dart';

// ignore: must_be_immutable
class MydonationRequest extends StatefulWidget {
  String? blood_type;
  String? name;
  String? city;
  String? phone;
  String? hospital;
  MydonationRequest(
      {super.key,
      required this.name,
      required this.blood_type,
      required this.city,
      required this.hospital,
      required this.phone});

  @override
  State<MydonationRequest> createState() => _MydonationRequestState();
}

class _MydonationRequestState extends State<MydonationRequest> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width,
      height: 146,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(10)),
      child: Stack(
        children: [
          Positioned(left: 310, top: 10, child: Image.asset("images/B+.png")),
          Positioned(
              left: 315,
              top: 30,
              child: Mytext(
                text: "${widget.blood_type}",
                size: 22,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              )),
          Positioned(
              left: 10,
              child: Mytext(
                text: "Name",
                size: 18,
                color: Color(0XFF7E7E7E),
              )),
          Positioned(
              top: 25,
              left: 10,
              child: Mytext(
                text: "${widget.name}",
                size: 20,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              )),
          Positioned(
              top: 50,
              left: 10,
              child: Mytext(
                text: "City",
                size: 18,
                color: Color(0XFF7E7E7E),
              )),
          Positioned(
              top: 80,
              left: 10,
              child: Mytext(
                text: "${widget.city}",
                size: 20,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              )),
          Positioned(
              top: 110,
              left: 10,
              child: Mytext(
                text: "${widget.hospital}",
                size: 14,
                color: Color(0XFF7E7E7E),
              )),
          Positioned(
              top: 105,
              left: 235,
              child: Mytext(
                text: "${widget.phone}",
                size: 20,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w500,
              )),
        ],
      ),
    );
  }
}
