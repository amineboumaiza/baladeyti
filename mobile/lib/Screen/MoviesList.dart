import 'package:flutter/material.dart';
import 'package:mobile/Models/Gouvernorat.dart';
import 'package:mobile/Models/Ticket.dart';
import 'package:mobile/Screen/CureentTicket.dart';
import 'package:mobile/Services/TicketService.dart';
import '../Constant.dart';
import '../Models/Services.dart';
import '../Models/municipality.dart';
import '../Services/GouvernoratService.dart';
import '../Services/MunicipalityService.dart';
import '../Services/Service.dart';
import 'Widget/AppBarMc.dart';
import 'Widget/RoundedButton.dart';

class MoviesList extends StatefulWidget {
  const MoviesList({super.key});
  @override
  State<MoviesList> createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  late List<ServiceModel> Allservice = List.empty(growable: true);
  AppServices s = AppServices();
  AppGouvernorat g = AppGouvernorat();
  AppMunicipality m = AppMunicipality();
  AppTicket _ticketService = AppTicket();
  submitReserve(int idService, int idMuni, BuildContext theContext) async  {
    if (idService >0 && idMuni>0) {
       ticketModel?  T =  await _ticketService.ReseveTicket(idService, idMuni);
      if ( T != null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) =>  CurrentTicket( ticket: T,)),
            (route) => false);
      } else {
        //toastMsg("Mot de passe incorrect !", theContext);
      }
    }
  }
  @override
  void initState() {
    super.initState();

  }

  int _value = 0;
  int _valueg = 1;
  int _valuem = 0 ; 

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          SizedBox(
            height: 10,
          ),
          AppBarMc(size: size),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'Réservez Vos tickets',
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: KSecondaryColor,
              ),
            ),
          ),
          FutureBuilder<Object>(
              future: g.getAllservices(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<GouvernoratModel> g =
                      snapshot.data as List<GouvernoratModel>;
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 20),
                    child: DropdownButton(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                        ),
                        iconSize: 40,
                        isExpanded: true,
                        isDense: true,
                        borderRadius: BorderRadius.circular(9),
                        value: (_valueg == 0) ? null : _valueg,
                        items: g.map<DropdownMenuItem>((GouvernoratModel gouv) {
                          return DropdownMenuItem(
                            value: gouv.id,
                            child: Text(gouv.name),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _valueg = int.parse(value.toString());
                            print("hoony");
                            print(_valueg);
                            // await thefunc(_value);
                            // setState(() {});
                          });
                        },
                        hint: Text("Choisir Service")),
                  );
                }
                return Text("out of the futyure");
              }),
          FutureBuilder<Object>(
              future: m.getAllMunicipalities(_valueg),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<municipalityModel> m =
                      snapshot.data as List<municipalityModel>;
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 20),
                    child: DropdownButton(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                        ),
                        iconSize: 40,
                        isExpanded: true,
                        isDense: true,
                        borderRadius: BorderRadius.circular(9),
                        value: (_valuem == 0) ? null : _valuem,
                        items: m.map<DropdownMenuItem>((municipalityModel muni) {
                          return DropdownMenuItem(
                            value: muni.id,
                            child: Text(muni.name),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _valuem = int.parse(value.toString());
                            print("hoony");
                            print(_valueg);
                            // await thefunc(_value);
                            // setState(() {});
                          });
                        },
                        hint: Text("Choisir Municipalité")),
                  );
                }
                return Text("Choisir");
              }),
          FutureBuilder<Object>(
              future: s.getAllservices(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ServiceModel> l = snapshot.data as List<ServiceModel>;
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 20),
                    child: DropdownButton(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                        ),
                        iconSize: 40,
                        isExpanded: true,
                        isDense: true,
                        borderRadius: BorderRadius.circular(9),
                        value: (_value == 0) ? null : _value,
                        items: l.map<DropdownMenuItem>((ServiceModel service) {
                          return DropdownMenuItem(
                            value: service.id,
                            child: Text(service.name),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _value = int.parse(value.toString());
                            print("hoony");
                            print(_value);
                            // await thefunc(_value);
                            // setState(() {});
                          });
                        },
                        hint: Text("Choisir Service")),
                  );
                }
                return Text("out of the futyure");
              }),
                          RoundedButton(
                text: 'Reservez votre Ticket',
                color: KPrimaryColor,
                textColor: KWihteColor,
                onPressed: () {
                //  _login();
                 submitReserve(_value, _valuem, context);
                },
              ),
        ]),
      ),
    );
  }
}
