import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class myButton extends StatelessWidget {
  Color? background_Color;
  Color? text_color;
  Color? color_border;
  Function()? function;
  String? name;
  double? font_Size;
  double padding_horizontal = 0;
  IconData? icon;
  myButton(
      {super.key,
      this.background_Color,
      this.text_color,
      required this.function,
      required this.name,
      this.font_Size,
      this.icon,
      this.padding_horizontal = 0});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      style: ElevatedButton.styleFrom(
        backgroundColor: background_Color,
        side: BorderSide(
          color: name == "Log In"
              ? Theme.of(context).primaryColor
              : Colors.transparent,
          width: 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: padding_horizontal, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              name == "Request"
                  ? Image.asset("images/partage.png")
                  : Icon(
                      icon,
                      size: 26,
                      color: Colors.white,
                    ),
              SizedBox(
                width: 10,
              ),
              Text(
                "${name}",
                style: TextStyle(
                  fontSize: font_Size,
                  color: text_color,
                ),
              ),
            ],
          )),
    );
  }
}
