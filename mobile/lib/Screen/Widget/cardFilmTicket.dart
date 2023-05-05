
import 'package:flutter/material.dart';


class cardFilm_ticket extends StatelessWidget {
  final String text;
  final Color color;

  const cardFilm_ticket({
    Key? key,
    required this.size,
    required this.text,
    required this.color,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.35,
      height: 60,
      color: color,
      child: Center(
        child: Wrap(
          children: [
            Text(
              text,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
