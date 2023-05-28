import 'package:shared_preferences/shared_preferences.dart';
import '../Models/Personne.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthService {
//sign with e-mail and password

  Future<UserApp?> signInEmailPassword(String mail, String pass) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print('yemchyy');
    print(mail);
    print(pass);
    late UserApp user;
    final response =
        await http.post(Uri.parse('http://10.0.2.2:8080/api/auth/login'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode({'email': mail, 'password': pass}));

    if (response.statusCode == 200) {
      Map<String, dynamic> res =
          json.decode(response.body) as Map<String, dynamic>;
      print(res);
      String jwt = res['jwt'];
      print('jwt');
      print(jwt);


      user = UserApp.fromMap(res);
      prefs.setInt('UserID', user.id);
      prefs.setString('jwt', jwt);

      print("UserID ");
      print(user.id);
      return user;
    
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      return null;
      print("noon");
      throw Exception();
    }
  }

//register with email and password
  Future<int?>  registerNewUser(
      String mail, String pass, String nom, String prenom) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    late UserApp user;
    final response = await http.post(
        Uri.parse('http://10.0.2.2:8080/api/auth/signup/client'),
        
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            {'email': mail, 'password': pass, 'nom': nom, 'prenom': prenom}));
print(response.statusCode);
    if (response.statusCode == 200) {
            print('res 01 ');

      Map<dynamic, dynamic> res = json.decode(response.body) as Map<dynamic, dynamic>;
      return 200;
    } else {


      throw Exception();
            return 400;

    }
  }

  //update info
  // Future updateUSerInfo(UserApp _user, bool pass) async {
  //   try {
  //     if (pass) {
  //       User? u = _auth.currentUser;
  //       await u!.updatePassword(_user.userPass);
  //     }
  //     UserServices().updateUser(_user);
  //     return _user;
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   }
  // }

//sign out
  Future<bool> logout() async {
    print('Logout');

    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
