import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class MyTextFormField extends StatefulWidget {
  Function(String?)? Save;
  String? Function(String?)? Valide;
  String? initValue;
  var input;
  String? name;
  IconData? icon;
  IconData? suffix_icon;
  bool obscure_Text = true;
  TextInputType? keyBoard;
  MyTextFormField({
    super.key,
    this.keyBoard,
    this.initValue,
    required this.name,
    this.icon,
    this.suffix_icon,
    this.obscure_Text = false,
    this.Save,
    this.Valide,
  });

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initValue,
      keyboardType: widget.keyBoard,
      onSaved: widget.Save,
      validator: widget.Valide,
      obscureText: widget.obscure_Text,
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {
                if (widget.obscure_Text == true) {
                  setState(() {
                    widget.obscure_Text = false;
                  });
                } else {
                  setState(() {
                    widget.obscure_Text = true;
                  });
                }
              },
              icon: Icon(widget.suffix_icon)),
          filled: true,
          fillColor: Color(0XFFF0F2F3),
          prefixIcon: widget.name == "Blood Type"
              ? Image.asset("images/TypeBlood.png")
              : Icon(
                  widget.icon,
                  size: 24,
                  color: Theme.of(context).primaryColor,
                ),
          hintText: "${widget.name}",
          hintStyle: TextStyle(fontSize: 18),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color(0XFFF0F2F3))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color(0XFFF0F2F3)))),
    );
  }
}
