// ignore_for_file: prefer_const_constructors, duplicate_ignore, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, must_be_immutable

import 'package:flutter/material.dart';

class BuildButton extends StatelessWidget {
  final String buttonText;
  final double buttonHeight;

  Function buttonPressed;

  BuildButton(this.buttonText, this.buttonHeight, this.buttonPressed);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      child: TextButton(
          style: TextButton.styleFrom(
              shape: CircleBorder(), padding: EdgeInsets.all(16.0)),
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            // ignore: prefer_const_constructors
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.64,
              fontFamily: 'Hanno',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          )),
    );
  }
}
