import 'package:flutter/material.dart';

import '../../Constant.dart';

//bare de recherche
class AppBarMc extends StatelessWidget {
  const AppBarMc({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
      child: Row(
        children: [
          Container(
            width: size.width * 0.6,
            height: 50,
            child: Column(
              children: [
                Text(
                  'Bonjour',
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontWeight: FontWeight.normal),
                ),
                  Text(
                  'Ben Ali Sabeur',
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
SizedBox(width: 20,),
          Container(
            width: size.width * 0.18,
            height: size.width * 0.09,
            decoration: BoxDecoration(
              border: Border.all(width: 2.0, color: KGreyColor),
              image: const DecorationImage(
                image: AssetImage('assets/logo.png'),
                fit: BoxFit.fill,
              ),

            ),
          )
        ],
      ),
    );
  }
}
