import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String? text;
   CustomText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text.toString());
  }
}
