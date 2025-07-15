import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Mylisttile extends StatefulWidget {
  String? image;
  Widget? trailing;
  String? name;
  Function()? function;
  Mylisttile(
      {super.key,
      required this.name,
      required this.image,
      this.trailing,
      required this.function});

  @override
  State<Mylisttile> createState() => _MylisttileState();
}

class _MylisttileState extends State<Mylisttile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: ListTile(
        leading: Image.asset("${widget.image}"),
        title: Text('${widget.name}'),
        trailing: widget.trailing,
        onTap: widget.function,
      ),
    );
  }
}
