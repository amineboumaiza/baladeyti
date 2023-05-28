import 'package:flutter/material.dart';
import 'package:mobile/Models/Gouvernorat.dart';
import 'package:mobile/Models/Ticket.dart';
import 'package:mobile/Screen/CureentTicket.dart';
import 'package:mobile/Screen/CureentTicketStream.dart';
import 'package:mobile/Services/TicketService.dart';
import 'package:motion_toast/resources/arrays.dart';
import '../Constant.dart';
import '../Models/Services.dart';
import '../Models/municipality.dart';
import '../Services/GouvernoratService.dart';
import '../Services/MunicipalityService.dart';
import '../Services/Service.dart';
import 'Widget/AppBarMc.dart';
import 'Widget/RoundedButton.dart';
import 'package:motion_toast/motion_toast.dart';

class Reserve extends StatefulWidget {
  const Reserve({super.key});
  @override
  State<Reserve> createState() => _ReserveState();
}

class _ReserveState extends State<Reserve> {
  late List<ServiceModel> Allservice = List.empty(growable: true);
  AppServices s = AppServices();
  AppGouvernorat g = AppGouvernorat();
  AppMunicipality m = AppMunicipality();
  AppTicket _ticketService = AppTicket();
  submitReserve(int idService, int idMuni, BuildContext theContext) async {
    if (idService > 0 && idMuni > 0) {
      print("xxxxxxxxxxxxxxxx oui xxxxxxxxxxxxxxxxx");

      ticketModel? T = await _ticketService.ReseveTicket(idService, idMuni);
      if (T.id == 0) {
        print("xxxxxxxxxxxxxxxx Nonnn 1  xxxxxxxxxxxxxxxxx");
_displayErrorMotionToast();
      //  _displayWarningMotionToast();
      } else {
        print("xxxxxxxxxxxxxxxx OUI 222 xxxxxxxxxxxxxxxxx");
       // _displayWarningMotionToast();

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CurrentTicketStream(
                      ticket: T,
                    )));
                    _displaySuccessMotionToast();
      }
    } else {
      print("xxxxxxxxxxxxxxxx nooooonn xxxxxxxxxxxxxxxxx");
         _displayWarningMotionToast();

    }
  }

  @override
  void initState() {
    super.initState();
  }

  int _value = 0;
  int _valueg = 1;
  int _valuem = 0;

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
              future: g.getAllGouvernorat(),
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
                        items:
                            m.map<DropdownMenuItem>((municipalityModel muni) {
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
              future: s.getOneService(1),
              builder: (context, snapshot) {
                if (snapshot.hasData) {}
                return Container();
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

  void _displayWarningMotionToast() {
    MotionToast.warning(
      title: const Text(
        'Veuilliez choisir tous les options ',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: const Text('Veuilliez choisir tous les options '),
      animationCurve: Curves.bounceIn,
      borderRadius: 0,
      animationDuration: const Duration(milliseconds: 1000),
    ).show(context);
  }


    void _displaySuccessMotionToast() {
    MotionToast toast = MotionToast.success(
      title: const Text(
        'Votre Ticket est bien reservez ',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      description: const Text(
        'Votre Ticket est bien reservez',
        style: TextStyle(fontSize: 12),
      ),
      // layoutOrientation: ToastOrientation.rtl,
      // animationType: AnimationType.fromRight,
      dismissable: true,
    );
    toast.show(context);
    Future.delayed(const Duration(seconds: 4)).then((value) {
      toast.dismiss();
    });
  }

   void _displayErrorMotionToast() {
    MotionToast.error(
      title: const Text(
        'Vous Avez reservez deja une Tickets pour ce Service',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: const Text('Vous Avez reservez deja une Tickets pour ce Service'),
      // position: MotionToastPosition.top,
      barrierColor: Colors.black.withOpacity(0.3),
      width: 300,
      height: 80,
      dismissable: false,
    ).show(context);
  }
}
