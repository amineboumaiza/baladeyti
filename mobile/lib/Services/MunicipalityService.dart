import 'dart:developer';

import 'package:mobile/Models/municipality.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;


class AppMunicipality {
  Future<List<municipalityModel>> getAllMunicipalities(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = Uri.parse('http://10.0.2.2:8080/municipalite/gouvernorat/id/$id');
    String? jwt = prefs.getString('jwt');
    var auth = 'Bearer $jwt';
    print('jwt ');
    print(jwt);

    print(auth);
    var headers = {'Authorization': auth};

    final response = await http.get(url, headers: headers);
    print(response.statusCode);

    if (response.statusCode == 200) {

      final res = jsonDecode(response.body);
      print(res);
      List<municipalityModel> LMuni = res.map<municipalityModel>((json) {
        print(json);
        return municipalityModel.fromMap(json);
      }).toList();
      print(LMuni.length);
      LMuni.forEach((municipalityModel s) {
        print(s);
      });
      return LMuni;
    } else {
      print("noon get user info");
      throw Exception();
    }
  }
}
