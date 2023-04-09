
import 'package:flutter/material.dart';

import '../../Constant.dart';
import '../Widget/RoundedButton.dart';
import '../Widget/TextFieldContainer.dart';
import '../Widget/backgroundSignUp.dart';
import 'SignIn.dart';


class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  _signInState createState() => _signInState();
}

class _signInState extends State<signUp> {
  bool _passwordVisible = true;
  //final AuthService _authService = AuthService();
  bool showPassword = true;
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

 // UserApp user = UserApp();
/*  submitLog(UserApp us, BuildContext theContext) async {
    if (_formKey.currentState!.validate() == true) {
      try {
        // toastMsg("e-mail est utilisée", theContext);
        if (await _authService.registerNewAgent(us) != null) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const completeSignUp()),
              (route) => false);
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          toastMsg("e-mail est utilisée", theContext);
        } else if (e.code == 'weak-password') {
          toastMsg("Mot de passe est faible !", theContext);
        }
      }
    }
  }
*/
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: backgroundSignUp(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
             /*   Image.asset(
                  "assets/logo.png",
                  width: size.width * 0.7,
                ),*/
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
                              //  user.userLastName = newValue.toString();
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
                             //   user.userName = newValue.toString();
                              },
                            ),
                            const SizedBox(height: 15),
                            TextFormField(
                              validator: (value) {
                                if (value == '') {
                                  return "le telephone est vide !";
                                }
                                if (value!.length != 12) {
                                  return "le nemero doit étre 12 chiffre !";
                                }
                              },
                              decoration: InputDecoration(
                                hintText: '+216 ** *** ***',
                                labelStyle: const TextStyle(color: KBlackColor),
                                labelText: 'Telephone :',
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
                              keyboardType: TextInputType.phone,
                              onChanged: (newValue) {
                              //  user.userPhone = newValue.toString();
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
                             //   user.userMail = newValue.toString();
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
                             //   user.userPass = newValue.toString();
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
                 /*   if (!connectivityChangeNotifier.connected) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text(
                          'No Internet Connection!!!',
                        ),
                        backgroundColor: Colors.red,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        action: SnackBarAction(
                          label: 'options',
                          onPressed: () {
                            print("snack is taped ");
                            AppSettings.openWIFISettings();
                          },
                          textColor: Colors.white,
                          disabledTextColor: Colors.grey,
                        ),
                      ));
                    } else {
                      submitLog(user, context);
                    }
                    */
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
                          MaterialPageRoute(
                              builder: (context) => const signIn()),
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
      );}
  }
