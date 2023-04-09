import 'package:flutter/material.dart';
import '../../Constant.dart';
import 'TextFieldContainer.dart';

class RoundedPasswordFiled extends StatefulWidget {
  const RoundedPasswordFiled({Key? key}) : super(key: key);

  @override
  _RoundedPasswordFiledState createState() => _RoundedPasswordFiledState();
}

class _RoundedPasswordFiledState extends State<RoundedPasswordFiled> {
  @override
  Widget build(BuildContext context) {
    bool _passwordVisible = false;
    return TextFiledContainer(
      child: TextField(
        keyboardType: TextInputType.text,
        obscureText: !_passwordVisible,
        decoration: InputDecoration(
            hintText: 'Mot de passe ',
            icon: const Icon(
              Icons.lock,
              color: KBlackColor,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: KBlackColor,
              ),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            ),
            border: InputBorder.none),
      ),
    );
  }
}
