import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/Services.dart';

class AppServices {
  Future<List<ServiceModel>> getAllservices() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = Uri.parse('http://10.0.2.2:8080/service/all');
    String? jwt = prefs.getString('jwt');
    var auth = 'Bearer $jwt';
    print('jwt ');
    print(jwt);

    print(auth);
    var headers = {'Authorization': auth};

    final response = await http.get(url, headers: headers);
    print(response.statusCode);

    if (response.statusCode == 200) {
      print("yess ");

      final res = jsonDecode(response.body);
      print(res);
      List<ServiceModel> LService = res.map<ServiceModel>((json) {
        print(json);
        return ServiceModel.fromMap(json);
      }).toList();
      print(LService.length);
      LService.forEach((ServiceModel s) {
        print(s);
      });
      return LService;
    } else {
      print("noon get user info");
      throw Exception();
    }
  }

  Future<ServiceModel> getOneService(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = Uri.parse('http://10.0.2.2:8080/service/id/$id');
    String? jwt = prefs.getString('jwt');
    var auth = 'Bearer $jwt';
    var headers = {'Authorization': auth};
    final response = await http.get(url, headers: headers);
    print(response.statusCode);
    if (response.statusCode == 200) {
      ServiceModel OneService;
      Map<String, dynamic> res = json.decode(response.body) as Map<String, dynamic>;
      OneService = ServiceModel.fromMap(res);
            print("Resss");

      print(res);
      print("one Service");
      print(OneService.name);
      return OneService;
    } else {
      print("Probleme ! Service non existant");
      throw Exception();
    }
  }
}