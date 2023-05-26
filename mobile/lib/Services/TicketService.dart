import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/Ticket.dart';

class AppTicket {
  Future<ticketModel> ReseveTicket(int idService, int idMunicipalite) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = Uri.parse('http://10.0.2.2:8080/tickets/reserve');
    String? jwt = prefs.getString('jwt');
    var auth = 'Bearer $jwt';
    print(auth);
    print('idService ');
    print(idService);
    print('idMunicipalite ');
    print(idMunicipalite);
    var headers = {'Authorization': auth,
              'Content-Type': 'application/json; charset=UTF-8',
};

    final response = await http.post(url,
        headers: headers,
        
        body: jsonEncode({
          "idService": idService,
          "idMunicipalite": idMunicipalite,
        }));
    print(response.statusCode);

    if (response.statusCode == 200) {
      Map<String, dynamic> res =
          json.decode(response.body) as Map<String, dynamic>;
      print(res);
      ticketModel Ticket = ticketModel.fromMap(res);

      return Ticket;
    } else {
      print(response.body);
      print("noon get user info");
      throw Exception();
    }
  }
    Future<List<ticketModel>> getAllTicketEncours(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = Uri.parse('http://10.0.2.2:8080/tickets/enCours');
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
      List<ticketModel> LMuni = res.map<ticketModel>((json) {
        print(json);
        return ticketModel.fromMap(json);
      }).toList();
      print(LMuni.length);
      LMuni.forEach((ticketModel s) {
        print(s);
      });
      return LMuni;
    } else {
      print("noon get user info");
      throw Exception();
    }
  }
}
