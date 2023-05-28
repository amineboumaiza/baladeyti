import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/Constant.dart';
import 'package:mobile/Models/Ticket.dart';
import 'package:mobile/Models/municipality.dart';
import 'package:mobile/Screen/HomePage.dart';
import 'package:mobile/Services/TicketService.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket_widget/ticket_widget.dart';
import '../Models/Gouvernorat.dart';
import '../Models/Services.dart';
import '../Services/GouvernoratService.dart';
import '../Services/MunicipalityService.dart';
import '../Services/Service.dart';

class Data {
  StreamController<String> _dataStreamController =
      StreamController<String>.broadcast();
  Stream<String> get dataStream => _dataStreamController.stream;

  String _variable = '';

  Future<void> fetchData(int idTick) async {
    var url = Uri.parse('http://10.0.2.2:8080/tickets/queue/$idTick');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jwt = prefs.getString('jwt');

    var auth = 'Bearer $jwt';

    var headers = {'Authorization': auth};
    print("ouiiiiiiiiiiii status code :  1");

    final response = await http.get(url, headers: headers);
    print(response.statusCode);

    if (response.statusCode == 200) {
      _variable = response.body;
      _dataStreamController.add(_variable);
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  void dispose() {
    _dataStreamController.close();
  }
}

// class Data {
//   static Future<String> fetchData(int idTick) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var url = Uri.parse('http://10.0.2.2:8080/tickets/queue/$idTick');
//     String? jwt = prefs.getString('jwt');
//     var auth = 'Bearer $jwt';

//     var headers = {'Authorization': auth};
//     print("ouiiiiiiiiiiii status code :  1");

//     final response = await http.get(url, headers: headers);
//     print(response.statusCode);

//     print("ouiiiiiiiiiiii status code : 2 ");
//     print(response.statusCode);
//         print("ouiiiiiiiiiiii status code : 3 ");

//     if (response.statusCode == 200) {
//       String _variable = response.body;
//       print(_variable);
//       return _variable;
//     } else {
//       throw Exception('Failed to fetch data');
//     }
//   }

// }

class CurrentTicketStream extends StatefulWidget {
  final ticketModel ticket;

  CurrentTicketStream({
    super.key,
    required this.ticket,
  });
  @override
  State<CurrentTicketStream> createState() => _CurrentTicketStreamState();
}

class _CurrentTicketStreamState extends State<CurrentTicketStream> {
  AppServices s = AppServices();
  AppGouvernorat g = AppGouvernorat();
  AppMunicipality m = AppMunicipality();
  AppTicket serviceTickets = AppTicket();
  late Future<municipalityModel> _municipalityModel;
  late Future<ServiceModel> _serviceModel;
  late Future<GouvernoratModel> _gouvernoratModel;
  Data data = Data();
  Stream<http.Response> getRandomNumberFact(int idTick) async* {
    yield* Stream.periodic(Duration(seconds: 4), (_) async {
      var url = Uri.parse('http://10.0.2.2:8080/tickets/queue/$idTick');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? jwt = prefs.getString('jwt');

      var auth = 'Bearer $jwt';

      var headers = {'Authorization': auth};
      print("ouiiiiiiiiiiii status code :  1");

      //final response = await http.get(url, headers: headers);
      //print(response.statusCode);

      return http.get(url, headers: headers);
    }).asyncMap((event) async => await event);
  }

  @override
  void initState() {
    super.initState();
    _municipalityModel = m.getOneMunicipality(widget.ticket.idMunicipalite);
    _serviceModel = s.getOneService(widget.ticket.idService);
    _gouvernoratModel = g.getOneGouvernorat(widget.ticket.idGouvernorat);

    print("on initit xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");

    data.fetchData(widget.ticket.id);

    print("on initit xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
  }

  @override
  Widget build(BuildContext context) {
    Future ComfirmerAnuuler() {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Center(child: Text('Annuler Cette Ticket')),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Vous êtes de supprimer votre Tickets ? '),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                  child: const Text('Non'),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              TextButton(
                child: const Text('Anuuler Ticket'),
                onPressed: () async {
                  // await AuthService().logout();
                  serviceTickets.CancelTicket(widget.ticket.id);

                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                      (route) => false);
                  //(context,MaterialPageRoute(builder: (context) => const signIn()));
                },
              )
            ],
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: KWihteColor,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: KWihteColor,
        // title: Text("Historique",
        // style: TextStyle(color: KBlackColor)),
      ),
      body: Center(
        child: TicketWidget(
          color: KGreyColor,
          width: 350,
          height: 480,
          isCornerRounded: true,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 120.0,
                    height: 25.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(width: 1.0, color: Colors.green),
                    ),
                    child: Center(
                      child: Text(
                        widget.ticket.num.toString(),
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "Date :" + widget.ticket.date.substring(0, 10),
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Center(
                          child: StreamBuilder<http.Response>(
                    stream: getRandomNumberFact(widget.ticket.id),
                    builder: (context, snapshot) => snapshot.hasData
                        ? Container(
                          child:     snapshot.data!.body == '0' ? new Container(
                           child:   Text(
                          'Etat: En_cours' ,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                          ) : new Container(
                            child: 
                            Text(
                          'Etat: ' + widget.ticket.etat,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                          )

                        )
                        : new Container(),
                  ),
                        )
                        
                        
                        
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center ,
                children: [
                  Text(
                    "Position : ",
                    style: TextStyle(
                        color: KRedColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  StreamBuilder<http.Response>(
                    stream: getRandomNumberFact(widget.ticket.id),
                    builder: (context, snapshot) => snapshot.hasData
                        ? Center(
                            child: Container(
                               decoration: new BoxDecoration(
    color: KRedColor
  ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 1  , horizontal:15 ),
                                child: Text(
                                snapshot.data!.body,
                                style: TextStyle(
                                    color: KWihteColor,
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold),
                                                        ),
                              ),
                            ))
                        : CircularProgressIndicator(),
                  ),
                ],
              ),
              FutureBuilder<ServiceModel>(
                  future: _serviceModel,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final service = snapshot.data!;
                      return Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Text(
                          '${service.name}',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                      );
                    }
                    return Text('out of  ');
                  }),
              FutureBuilder<municipalityModel>(
                  future: _municipalityModel,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final muni = snapshot.data!;
                      return Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Municipalité',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: ticketDetailsWidget('Nom', '${muni.name}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child:
                                  ticketDetailsWidget('Adresse', '${muni.rue}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: ticketDetailsWidget(
                                  'Code Postale', '${muni.codePostale}'),
                            ),
                            SizedBox(height: 5)
                          ],
                        ),
                      );
                    }
                    return Text('out of  ');
                  }),
              FutureBuilder<GouvernoratModel>(
                  future: _gouvernoratModel,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final gauv = snapshot.data!;
                      return Padding(
                        padding: const EdgeInsets.only(top: 0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Gouvernorat',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: ticketDetailsWidget('Nom', '${gauv.name}'),
                            ),
                          ],
                        ),
                      );
                    }
                    return Text('out of  ');
                  }),
              SizedBox(height: 5),
              Center(
                child: widget.ticket.etat != 'en_attente'
                    ? Container()
                    : Align(
                        alignment: Alignment.center,
                        child: TextButton.icon(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(KRedColor),
                            ),
                            label: Text('Anuller Cette Ticket',
                                style: TextStyle(color: KWihteColor)),
                            icon: Icon(
                              Icons.cancel,
                              color: KWihteColor,
                            ),
                            onPressed: () {
                              ComfirmerAnuuler();
                            }),
                      ),
              ),
              SizedBox(height: 2),
              Center(
                child: Container(
                  width: 70.0,
                  height: 30.0,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/logo.png'),
                          fit: BoxFit.fill)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget ticketDetailsWidget(String firstTitle, String firstDesc) {
  return Column(
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          firstTitle + " ",
          textAlign: TextAlign.left,
          style: const TextStyle(color: KSecondaryColor),
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          firstDesc,
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      SizedBox(
        height: 5,
      ),
    ],
  );
}

class PeriodicRequester extends StatelessWidget {
  Stream<http.Response> getRandomNumberFact(int idTick) async* {
    yield* Stream.periodic(Duration(seconds: 5), (_) async {
      var url = Uri.parse('http://10.0.2.2:8080/tickets/queue/$idTick');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? jwt = prefs.getString('jwt');

      var auth = 'Bearer $jwt';

      var headers = {'Authorization': auth};
      print("ouiiiiiiiiiiii status code :  1");

      //final response = await http.get(url, headers: headers);
      //print(response.statusCode);

      return http.get(url, headers: headers);
    }).asyncMap((event) async => await event);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<http.Response>(
      stream: getRandomNumberFact(78),
      builder: (context, snapshot) => snapshot.hasData
          ? Center(child: Text(snapshot.data!.body))
          : CircularProgressIndicator(),
    );
  }
}
