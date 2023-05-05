import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../config.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

   Future<String?> _login() async {
    final response = await http.post(Uri.parse('$BaseCnUrl/api/auth/signup'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode( {
        "email": "sabeurbenali663@gmail.com",
        "prenom": "sabeur",
        "nom": "ben ali",
        "password": "saber"
      }),);

    if (response.statusCode == 200) {
      Map res = json.decode(response.body) as Map<String, dynamic>;
print("ahlmaaa");
 //     return res['token'] as String;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      print("3assba");
      throw Exception('Failed to register user');
    }
  }

  Future<void> _login2() async {
    final username = _usernameController.text;
    final password = _passwordController.text;
    print('user name log ' + username);
    print('password ' + password);

    final response = await http.post(
      Uri.parse('localhost:8080/api/auth/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": "sabeurbenali663@gmail.com",
        "prenom": "sabeur",
        "nom": "ben ali",
        "password": "saber"
      }),
    );

    if (response.statusCode == 200) {
      // Navigate to the home screen if the authentication was successful
      print("oui sayééé");
      Navigator.pushNamed(context, '/home');
    } else {
      print("nonn ya sayééé");
      // Show an error message if the authentication failed
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Invalid username or password'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Login'),
              onPressed: _login,
            ),
          ],
        ),
      ),
    );
  }
}
