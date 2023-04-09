
import 'package:flutter/material.dart';

import '../../Constant.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color, textColor;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: KBlackColor.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(1, 6))
      ], color: KWihteColor, borderRadius: BorderRadius.circular(29)),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(29),
          child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: color,
                onSurface: KSecondaryColor,
                padding: EdgeInsets.symmetric(vertical: 20)),
            onPressed: onPressed,
            child: Text(
              text,
              style: TextStyle(color: textColor, fontSize: 20),
            ),
          )),
    );
  }
}
