import 'package:flutter/material.dart';
import 'package:mobile/Constant.dart';
import 'package:mobile/Models/Ticket.dart';
import 'package:mobile/Models/municipality.dart';
import 'package:mobile/Screen/HomePage.dart';
import 'package:ticket_widget/ticket_widget.dart';

import '../Models/Gouvernorat.dart';
import '../Models/Services.dart';
import '../Services/GouvernoratService.dart';
import '../Services/MunicipalityService.dart';
import '../Services/Service.dart';

class CurrentTicket extends StatefulWidget {
  final ticketModel ticket;

  CurrentTicket({
    super.key,
    required this.ticket,
  });
  @override
  State<CurrentTicket> createState() => _CurrentTicketState();
}

class _CurrentTicketState extends State<CurrentTicket> {
  AppServices s = AppServices();
  AppGouvernorat g = AppGouvernorat();
  AppMunicipality m = AppMunicipality();

  late Future<municipalityModel> _municipalityModel;
  late Future<ServiceModel> _serviceModel;
  late Future<GouvernoratModel> _gouvernoratModel;

  @override
  void initState() {
    super.initState();
    _municipalityModel = m.getOneMunicipality(widget.ticket.idMunicipalite);
    _serviceModel = s.getOneService(widget.ticket.idService);
    _gouvernoratModel = g.getOneGouvernorat(widget.ticket.idGouvernorat);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KWihteColor,
      appBar:       AppBar(
        elevation:  0 ,
         iconTheme: IconThemeData(
    color: Colors.black, //change your color here
  ),
        backgroundColor: KWihteColor,
        // title: Text("Historique",
        // style: TextStyle(color: KBlackColor)),
      ),
      body: Center(
        child: TicketWidget(
             color : KGreyColor,

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
                        child: Text(
                          'Etat: ' + widget.ticket.etat,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
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
                            SizedBox(height: 30)
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
              SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.only(top: 0.0, left: 20.0, right: 20.0),
                child: Container(
                  width: 250.0,
                  height: 80.0,
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
