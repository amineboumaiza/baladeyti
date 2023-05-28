import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile/Models/Personne.dart';
import '../../Constant.dart';
import '../../Services/Auth.dart';
import '../HomePage.dart';
import '../Widget/RoundedButton.dart';
import 'SignUp.dart';

import '../widget/backgroundLogin.dart';

class signIn extends StatefulWidget {
  const signIn({Key? key}) : super(key: key);

  @override
  _signInState createState() => _signInState();
}

class _signInState extends State<signIn> {
  final AuthService _authService = AuthService();

   String userMail='';
   String userPass='';

  bool showPassword = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  toastMsg(String msg, BuildContext theContext) {
    ScaffoldMessenger.of(theContext).showSnackBar(SnackBar(
      content: Text(msg),
      behavior: SnackBarBehavior.floating,
      elevation: 15,
      backgroundColor: Colors.redAccent,
    ));
  }

  RegExp exp = RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$');
  submitLog(String userMail, String userPass, BuildContext theContext) async  {
    if (_formKey.currentState!.validate() == true) {
      // _formKey.currentState!.save();

      /*        _authService
            .signInEmailPassword(us.userMail, us.userPass)
            .
            .whenComplete(() => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
                (route) => false)); */
 UserApp?  a =  await _authService.signInEmailPassword(userMail, userPass);
      if ( a != null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false);
      } else {

        print("elsseee ");
        toastMsg("E-mail ou Mot de passe incorrecte ", theContext);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return backgroundLogin(
      child: SingleChildScrollView(
        child: Material(
          type: MaterialType.transparency,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/logo.png",
                width: size.width * 0.5,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Bienvenue !",
                style: TextStyle(
                    fontSize: 20,
                    color: KBlackColor,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "Se connecter pour continuer",
                style: TextStyle(
                  fontSize: 20,
                  color: KBlackColor,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    //email field
                    Container(
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
                      child: TextFormField(
                        validator: (value) {
                          if (value == '') {
                            return "Adesse e-mail est vide !";
                          } else if (!exp.hasMatch(value!)) {
                            return "Adesse e-mail incorrect !";
                          }
                        },
                        decoration: const InputDecoration(
                            hintText: "Adresse e-mail",
                            icon: Icon(
                              Icons.mail_outline,
                              color: KBlackColor,
                            ),
                            border: InputBorder.none),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (newValue) {
                          userMail = newValue.toString();
                        },
                      ),
                    ),
                    //space between
                    const SizedBox(
                      height: 30,
                    ),
                    //password field
                    Container(
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
                      child: TextFormField(
                        validator: (value) {
                          if (value == '') {
                            return "Mot de passe est vide !";
                          } else if (value!.length < 3) {
                            return "Mot de passe doit étre de 6 caracteres !";
                          }
                        },
                        obscureText: showPassword,
                        decoration: InputDecoration(
                            hintText: "Mot de passe ",
                            icon: const Icon(
                              Icons.lock,
                              color: KBlackColor,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                (showPassword)
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: KBlackColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                            ),
                            border: InputBorder.none),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (newValue) {
                          userPass = newValue.toString();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              RoundedButton(
                text: 'LOGIN',
                color: KPrimaryColor,
                textColor: KWihteColor,
                onPressed: () {
                //  _login();
                 submitLog(userMail, userPass, context);
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Vous n'avez pas encore de compte ?",
                    style: TextStyle(
                      fontSize: 14,
                      color: KBlackColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const signUp()));
                    },
                    child: const Text(
                      " Créez-en un !",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: KBlackColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
