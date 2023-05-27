import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ticket_material/ticket_material.dart';

import '../Constant.dart';
import '../Models/Services.dart';
import '../Models/Ticket.dart';
import '../Models/municipality.dart';
import '../Services/MunicipalityService.dart';
import '../Services/Service.dart';
import '../Services/TicketService.dart';
import 'CureentTicket.dart';

class HistoryTicket extends StatefulWidget {
  const HistoryTicket({super.key});

  @override
  State<HistoryTicket> createState() => _HistoryTicketState();
}

class _HistoryTicketState extends State<HistoryTicket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
         iconTheme: IconThemeData(
    color: Colors.black, //change your color here
  ),
        backgroundColor: KWihteColor,
        title: Text("Historique",
        style: TextStyle(color: KBlackColor)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
                                FutureBuilder<Object>(
                          future: AppTicket().getAllTicketHistory(),
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
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: TicketMaterial(
                                                height: 140,
                                                colorBackground: KGreyColor,
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
                                                                          KBlackColor)),
                                                              child: Text(
                                                                '${lm[index].num}',
                                                                style: TextStyle(
                                                                  color:
                                                                      KBlackColor,
                                                                ),
                                                              ),
                                                            ),
                                                            Spacer(),
                                                            Text(
                                                              '${lm[index].etat}',
                                                              style: TextStyle(
                                                                color: KBlackColor,
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
                                                                                KBlackColor,
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
                                                                color: KBlackColor,
                                                              ),
                                                            ),
                                                            Text(
                                                              '${lm[index].date}'
                                                                  .substring(0, 10),
                                                              style: TextStyle(
                                                                color: KBlackColor,
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
                                                                              KBlackColor,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        '${muni.name}',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              KBlackColor,
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
                                                                          Color.fromARGB(255, 28, 31, 30))),
                                                              onPressed: () => {
                                                                    Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder:
                                                                              (context) =>
                                                                                  CurrentTicket(
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
                          })
          ],
        ),
      )
    );
  }
}