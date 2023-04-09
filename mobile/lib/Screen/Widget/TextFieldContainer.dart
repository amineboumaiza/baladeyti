import 'package:flutter/material.dart';

import '../../Constant.dart';

class TextFiledContainer extends StatelessWidget {
  final Widget child;
  const TextFiledContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          border: Border.all(color: KBlackColor.withOpacity(0.1)),
          boxShadow: [
            BoxShadow(
                color: KBlackColor.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 6,
                offset: const Offset(1, 6))
          ],
          color: KWihteColor,
          borderRadius: BorderRadius.circular(29)),
      child: child,
    );
  }
}

class TextFiledContainerType2 extends StatelessWidget {
  final Widget child;
  const TextFiledContainerType2({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: size.width * 0.9,
      child: child,
    );
  }
}
