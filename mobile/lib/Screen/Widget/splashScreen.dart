import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:animated_splash_screen/animated_splash_screen.dart';

import '../Authentication/SignIn.dart';
import '../HomePage.dart';
import 'LoginPage.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    String userId = '';
    print("splash is displayed");

    return 
                    Scaffold(
              body: Container(
                constraints: const BoxConstraints.expand(),
                child: AnimatedSplashScreen(
                    splashIconSize: size.height * 0.95,
                    duration: 1800,
                    splash: 'assets/splash.gif',
                    nextScreen:
                         LoginPage(),
                    splashTransition: SplashTransition.fadeTransition,
                    //   pageTransitionType: PageTransitionType.scale,
                    backgroundColor: Colors.white),
              ),
            );
          }
  
  }
