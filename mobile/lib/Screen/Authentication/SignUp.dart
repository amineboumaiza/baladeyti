import 'package:flutter/material.dart';

import '../../Constant.dart';
import '../../Models/Personne.dart';
import '../../Services/Auth.dart';
import '../Widget/RoundedButton.dart';
import '../Widget/TextFieldContainer.dart';
import '../Widget/backgroundSignUp.dart';
import 'SignIn.dart';
import 'completSignUP.dart';

class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  _signInState createState() => _signInState();
}

class _signInState extends State<signUp> {
  bool _passwordVisible = true;
  final AuthService _authService = AuthService();

  bool showPassword = true;
  late String userPass;
  late String userLastName;
  late String userName;
  late String userMail;
  RegExp exp = RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  toastMsg(String msg, BuildContext theContext) {
    ScaffoldMessenger.of(theContext).showSnackBar(SnackBar(
      content: Text(msg),
      behavior: SnackBarBehavior.floating,
      elevation: 15,
      backgroundColor: Colors.redAccent,
    ));
  }

  submitLog(String userPass, String userLastName, String userName,
      String userMail, BuildContext theContext) async {
    if (_formKey.currentState!.validate() == true) {
      try {
        int? a = await _authService.registerNewUser(
            userMail, userPass, userName, userLastName);
        if (a == 200) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const completeSignUp()),
              (route) => false);
        }
      } catch (e) {
        print(e);

        toastMsg("e-mail est utilisée", theContext);
      }
    }
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: backgroundSignUp(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/logo.png",
                width: size.width * 0.7,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Créer un compte",
                style: TextStyle(
                    fontSize: 20,
                    color: KBlackColor,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFiledContainerType2(
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (value == '') {
                                return "Le nom est vide !";
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Entrez votre nom',
                              labelStyle: const TextStyle(color: KBlackColor),
                              labelText: 'Nom :',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                  color: KGreyColor,
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                  color: KBlackColor,
                                  width: 2.0,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                            onChanged: (newValue) {
                              userLastName = newValue.toString();
                            },
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            validator: (value) {
                              if (value == '') {
                                return "le prénom est vide !";
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Entrez votre prénom',
                              labelStyle: const TextStyle(color: KBlackColor),
                              labelText: 'Prénom :',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                  color: KGreyColor,
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                  color: KBlackColor,
                                  width: 2.0,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                            onChanged: (newValue) {
                              userName = newValue.toString();
                            },
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return "Adesse e-mail est vide !";
                              } else if (!exp.hasMatch(value!)) {
                                return "Adesse e-mail incorrect !";
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Entrez votre e-mail',
                              labelStyle: const TextStyle(color: KBlackColor),
                              labelText: 'E-mail :',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                  color: KGreyColor,
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                  color: KBlackColor,
                                  width: 2.0,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                            onChanged: (newValue) {
                              userMail = newValue.toString();
                            },
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            validator: (value) {
                              if (value == '') {
                                return "Mot de passe est vide !";
                              } else if (value!.length < 6) {
                                return "Mot de passe doit étre de 6 caracteres !";
                              }
                            },
                            obscureText: showPassword,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                    color: KBlackColor,
                                    width: 2.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                    color: KGreyColor,
                                    width: 2.0,
                                  ),
                                ),
                                hintText: "Mot de passe ",
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
                        ],
                      ),
                    ),
                    //space between
                    const SizedBox(
                      height: 15,
                    ),
                    //password field
                  ],
                ),
              ),
              RoundedButton(
                text: "S'inscrire",
                color: KPrimaryColor,
                textColor: KWihteColor,
                onPressed: () {
                  submitLog(
                      userPass, userLastName, userName, userMail, context);
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Vous avez déjà un compte ?",
                    style: TextStyle(
                      fontSize: 14,
                      color: KBlackColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const signIn()),
                      );
                    },
                    child: const Text(
                      " se connecter !",
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
