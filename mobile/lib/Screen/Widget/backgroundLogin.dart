import 'package:flutter/material.dart';

class backgroundLogin extends StatelessWidget {
  final Widget child;
  const backgroundLogin({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //  type: MaterialType.canvas,
      body: Container(
        constraints: const BoxConstraints.expand(),
        color: Colors.white,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                'assets/1.png',
                width: size.width * 0.2,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset('assets/2.png', width: size.width * 0.3),
            ),
            Positioned(
              bottom: 0,
              left: 30,
              child: Image.asset(
                'assets/3.png',
                width: size.width * 0.4,
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
