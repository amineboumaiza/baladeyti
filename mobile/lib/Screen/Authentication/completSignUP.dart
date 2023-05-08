import 'package:flutter/material.dart';
import 'package:mobile/Screen/HomePage.dart';

import '../../Constant.dart';
import '../Widget/RoundedButton.dart';
import '../Widget/backgroundSignUp.dart';
import 'SignUp.dart';

class completeSignUp extends StatefulWidget {
  const completeSignUp({Key? key}) : super(key: key);

  @override
  _completeSignUpState createState() => _completeSignUpState();
}

class _completeSignUpState extends State<completeSignUp> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: backgroundSignUp(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  Image.asset(
                    "assets/logo.png",
                    width: size.width * 0.5,
                  ),
                  const SizedBox(height: 60),
                  const Text(
                    "Votre compte est bien créé",
                    style: TextStyle(
                        fontSize: 20,
                        color: KBlackColor,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  const Center(
                    child: Text(
                      "Vous pouvez maintenant réserver  vos tickets en ligne ",
                      style: TextStyle(
                        fontSize: 20,
                        color: KBlackColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 45),

                  RoundedButton(
                    text: "Continue",
                    color: KPrimaryColor,
                    textColor: KWihteColor,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
