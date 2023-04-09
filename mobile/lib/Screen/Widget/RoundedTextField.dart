
import 'package:flutter/material.dart';

import '../../Constant.dart';
import 'TextFieldContainer.dart';


class RoundedTextFiled extends StatelessWidget {
  final String text;
  final IconData icon;
  const RoundedTextFiled({
    Key? key, required this.text,  required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFiledContainer(
      child: TextField(
        decoration: InputDecoration(
            hintText: text,
            icon: Icon(
             icon,
              color: KBlackColor,
            ),
            border: InputBorder.none),
      ),
    );
  }
}