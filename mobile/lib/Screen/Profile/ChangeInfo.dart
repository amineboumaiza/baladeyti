
import 'package:flutter/material.dart';

import '../../Constant.dart';
import '../../Models/Personne.dart';
import '../../Services/TicketService.dart';
import '../../Services/UserServices/UserServices.dart';
import '../Widget/RoundedButton.dart';
import '../Widget/TextFieldContainer.dart';


class ChangeInfo extends StatefulWidget {
  final UserApp passedUser;
  const ChangeInfo({Key? key, required this.passedUser}) : super(key: key);

  @override
  _ChangeInfoState createState() => _ChangeInfoState();
}

class _ChangeInfoState extends State<ChangeInfo> {
    late String userLastName;
  late String userName;
  late String userMail;
  RegExp exp = RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$');
  toastMsg(String msg, BuildContext theContext) {
    print("toast affiche");
    ScaffoldMessenger.of(theContext).showSnackBar(SnackBar(
      content: Text(msg),
      behavior: SnackBarBehavior.fixed,
      elevation: 15,
      backgroundColor: Colors.redAccent[300],
    ));
  }

 submitLog(String Email, String nom, String prenom ,  BuildContext theContext) async {
UserServices().updateUserInfo(Email , nom , prenom);

  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool showPassword = true;
  String tempStr = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 5, 0, 0),
                    child: IconButton(
                      iconSize: 35,
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Center(
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
                          "Mise à jour mes informations",
                          style: TextStyle(
                              fontSize: 20,
                              color: KBlackColor,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFiledContainerType2(
                                child: Column(
                                  children: [
                                    TextFormField(
                                      initialValue:
                                          widget.passedUser.name,
                                      validator: (value) {
                                        if (value == '') {
                                          return "Le nom est vide !";
                                        }
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'Entrez votre nom',
                                        labelStyle:
                                            const TextStyle(color: KBlackColor),
                                        labelText: 'Nom :',
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                            color: KGreyColor,
                                            width: 2.0,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                            color: KBlackColor,
                                            width: 2.0,
                                          ),
                                        ),
                                      ),
                                      keyboardType: TextInputType.text,
                                      onChanged: (newValue) {
                                      widget.passedUser.lastName =
                                            newValue.toString();
                                      },
                                    ),
                                    const SizedBox(height: 15),
                                    TextFormField(
                                      initialValue: widget.passedUser.lastName,
                                      validator: (value) {
                                        if (value == '') {
                                          return "le prénom est vide !";
                                        }
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'Entrez votre prénom',
                                        labelStyle:
                                            const TextStyle(color: KBlackColor),
                                        labelText: 'Prénom :',
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                            color: KGreyColor,
                                            width: 2.0,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                            color: KBlackColor,
                                            width: 2.0,
                                          ),
                                        ),
                                      ),
                                      keyboardType: TextInputType.text,
                                      onChanged: (newValue) {
                                       // widget.passedUser.userName =
                                            newValue.toString();
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
                                    const SizedBox(height: 15),

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
                        const SizedBox(
                          height: 25,
                        ),
                        RoundedButton(
                          text: "Enregistrer",
                          color: KPrimaryColor,
                          textColor: KWihteColor,
                          onPressed: () {
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}