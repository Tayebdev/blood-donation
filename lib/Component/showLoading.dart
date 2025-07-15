import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

showdialog(context) {
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: LoadingAnimationWidget.inkDrop(
            color: Theme.of(context).primaryColor,
            size: 40,
          ),
        );
      });
}
