import 'package:flutter/material.dart';
import 'package:mobile/Screen/CureentTicket.dart';
import 'package:mobile/Screen/CureentTicketStream.dart';
import 'package:mobile/Screen/HistoryTicket.dart';
import 'package:mobile/Services/TicketService.dart';
import 'package:ticket_material/ticket_material.dart';

import '../Constant.dart';
import '../Models/Gouvernorat.dart';
import '../Models/Services.dart';
import '../Models/Ticket.dart';
import '../Models/municipality.dart';
import '../Services/GouvernoratService.dart';
import '../Services/MunicipalityService.dart';
import '../Services/Service.dart';
import 'Widget/Loading.dart';
import 'Widget/RoundedButton.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  String uID = '';
  @override
  void initState() {
    super.initState();
  }

  AppServices s = AppServices();
  AppGouvernorat g = AppGouvernorat();
  AppMunicipality m = AppMunicipality();

  int _valueg = 0;
  @override
  Widget build(BuildContext context) {
    String currentDate = DateTime.now().toString().substring(0, 10);
    Size size = MediaQuery.of(context).size;
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {
          print("refreched");
        });
      },
      displacement: 150.0,
      child: ListView(
        shrinkWrap: true,
        // physics: const BouncingScrollPhysics(),
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Text(
                          "Mes tickets",
                          style: TextStyle(
                              fontSize: 25,
                              color: KBlackColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                    //list tickets that are expired
                    FutureBuilder<Object>(
                        future: AppTicket().getAllTicketEncoursEnAttente(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<ticketModel> lm =
                                snapshot.data as List<ticketModel>;

                            return ListView.builder(
                              itemCount: lm.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Container(
                                  child: Column(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 3,
                                          ),
                                          TicketMaterial(
                                            height: 140,
                                            colorBackground: KGreenColor,
                                            leftChild: Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Container(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .all(5.0),
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  width: 1.5,
                                                                  color:
                                                                      KWihteColor)),
                                                          child: Text(
                                                            '${lm[index].num}',
                                                            style: TextStyle(
                                                              color:
                                                                  KWihteColor,
                                                            ),
                                                          ),
                                                        ),
                                                        Spacer(),
                                                        Text(
                                                          '${lm[index].etat}',
                                                          style: TextStyle(
                                                            color: KWihteColor,
                                                          ),
                                                        ), // use Spacer
                                                      ],
                                                    ),
                                                    FutureBuilder<ServiceModel>(
                                                        future: AppServices()
                                                            .getOneService(
                                                                lm[index]
                                                                    .idService),
                                                        builder: (context,
                                                            snapshot) {
                                                          if (snapshot
                                                              .hasData) {
                                                            final muni =
                                                                snapshot.data!;
                                                            return Container(
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    child: Text(
                                                                      '${muni.name}',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontSize:
                                                                            20.0,
                                                                        color:
                                                                            KWihteColor,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          }
                                                          return Text(
                                                              'out of  ');
                                                        }),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center, //Center Row contents horizontally,

                                                      children: [
                                                        Text(
                                                          'Date : ',
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: KWihteColor,
                                                          ),
                                                        ),
                                                        Text(
                                                          '${lm[index].date}'
                                                              .substring(0, 10),
                                                          style: TextStyle(
                                                            color: KWihteColor,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    FutureBuilder<
                                                            municipalityModel>(
                                                        future: AppMunicipality()
                                                            .getOneMunicipality(lm[
                                                                    index]
                                                                .idMunicipalite),
                                                        builder: (context,
                                                            snapshot) {
                                                          if (snapshot
                                                              .hasData) {
                                                            final muni =
                                                                snapshot.data!;
                                                            return Container(
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'Municipalité:',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color:
                                                                          KWihteColor,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    '${muni.name}',
                                                                    style:
                                                                        TextStyle(
                                                                      color:
                                                                          KWihteColor,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          }
                                                          return Text(
                                                              'out of  ');
                                                        }),
                                                    Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: TextButton(
                                                          style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty.all(
                                                                      Color.fromARGB(
                                                                          255,
                                                                          0,
                                                                          65,
                                                                          43))),
                                                          onPressed: () => {
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              CurrentTicketStream(
                                                                                ticket: lm[index],
                                                                              )),
                                                                )
                                                              },
                                                          child: const Text(
                                                            "Vour Ticket",
                                                            style: TextStyle(
                                                              color:
                                                                  KWihteColor,
                                                            ),
                                                          )),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            rightChild: Container(),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          }
                          return Container();
                        }),
                        SizedBox(height: 10,),                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: RoundedButton(
                                         text: 'Voir Historique',
                                         color: KPrimaryColor,
                                         textColor: KWihteColor,
                                         onPressed: () {
                                            Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context) => HistoryTicket()),
                           );
                                         },
                                       ),
                         ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildLeft() {
  return Container(
    child: Center(
      child: Text('LEFT PART'),
    ),
  );
}

Widget _buildRight() {
  return Container(
    child: Center(
      child: Icon(Icons.airplanemode_active),
    ),
  );
}
