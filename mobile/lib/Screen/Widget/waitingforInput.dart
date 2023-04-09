import 'package:flutter/material.dart';

class WaitingInput extends StatelessWidget {
  const WaitingInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(height: 50),
        Center(
          child: Stack(
            children: [
              Image(
                image: const AssetImage('assets/lookFor.png'),
                height: size.height * 0.35,
                fit: BoxFit.fitWidth,
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(30, 100, 0, 5),
                child: Text.rich(
                  TextSpan(children: [
                    TextSpan(
                        text: "Choisissez une date\n s'il vous plait ☺  \n",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                  ]),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
