import 'package:flutter/material.dart';

import '../Constant.dart';
import 'Widget/Loading.dart';


class MyTicket extends StatefulWidget {
  const MyTicket({Key? key}) : super(key: key);

  @override
  State<MyTicket> createState() => _MyTicketState();
}

/* List<TicketData> getALlTicketData(String id, BuildContext context) {
  List<TicketData> a = List.empty(growable: true);
  FutureBuilder(
      future: UserServices().getListTicketData(id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final l = snapshot.data as List<Future<TicketData>>;
          return ListView.builder(
              itemCount: l.length,
              itemBuilder: (BuildContext context, int index) {
                return FutureBuilder(
                    future: l[index],
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        a.add(snapshot.data as TicketData);
                      }
                      return const Widget();
                    });
              });
        }
      });
  return a;
} */
String rakahdate(DateTime d) {
  String ch = d.toString();
  String ch2 =
      ch[8] + ch[9] + '-' + ch[5] + ch[6] + '-' + ch[0] + ch[1] + ch[2] + ch[3];
  return ch2;
}

String rakahdateInverse(String ch) {
  String ch2 =
      ch[6] + ch[7] + ch[8] + ch[9] + '-' + ch[3] + ch[4] + '-' + ch[0] + ch[1];
  return ch2;
}

int cmpDates(String d1, String d2) {
  d1 = rakahdateInverse(d1);

  return DateTime.parse(d1).compareTo(DateTime.parse(d2));
}

class _MyTicketState extends State<MyTicket> {
  String uID = '';
  @override
  void initState() {
    super.initState();
  /*  SharedPreferences.getInstance().then((prefValue) => {
          setState(() {
            uID = prefValue.getString('UserID') ?? "#####";
          })
        });*/
  }

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
                  //list tickets that are not expired
                  FutureBuilder(
               //       future: UserServices().getListTicketData(uID),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                            return const Text(
                                'No connection with data base !!!');
                          case ConnectionState.waiting:
                            return const Loading();
                          default:
                            if (snapshot.hasError) {
                              return Center(
                                child: Text(
                                  '${snapshot.error} occured',
                                  style: const TextStyle(fontSize: 18),
                                ),
                              );

                              // if we got our data
                            } else if (snapshot.hasData) {
                             final lm = snapshot.data as List<Future<TicketData>>;
                              //all good to this point
                              return ListView.builder(
                                  physics: const ClampingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: lm.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return FutureBuilder(
                                      future: lm[index],
                                      builder: (context, snapshot) {
                                        TicketData td = TicketData();
                                        if (snapshot.hasData) {
                                          td = snapshot.data as TicketData;

                                         /* if (cmpDates(
                                                  td.showDate, currentDate) >=
                                              0) {
                                            return Column(
                                              children: [
                                                Ticket(
                                                  color:
                                                    Color(0xffcce5ff),
                                                  td: snapshot.data
                                                      as TicketData,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                )
                                              ],
                                            );
                                          } else {
                                            return const SizedBox(
                                              height: 0,
                                            );
                                          }*/
                                        }
                                        return const SizedBox(
                                          height: 0,
                                        );
                                      },
                                    );
                                  });
                            }
                            return const Loading();
                        }
                      }),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: const [
                      Text(
                        "Historiques",
                        style: TextStyle(
                            fontSize: 25,
                            color: KBlackColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  //list tickets that are expired
                  FutureBuilder(
              //        future: UserServices().getListTicketData(uID),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                            return const Text(
                                'No connection with data base !!!');
                          case ConnectionState.waiting:
                            return const Loading();
                          default:
                            if (snapshot.hasError) {
                              return Center(
                                child: Text(
                                  '${snapshot.error} occured',
                                  style: const TextStyle(fontSize: 18),
                                ),
                              );

                              // if we got our data
                            } else if (snapshot.hasData) {
                              final lm =
                                  snapshot.data as List<Future<TicketData>>;
                              //all good to this point
                              return ListView.builder(
                                  physics: const ClampingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: lm.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return FutureBuilder(
                                      future: lm[index],
                                      builder: (context, snapshot) {
                                        TicketData td = TicketData();
                                      /*  if (snapshot.hasData) {
                                          td = snapshot.data as TicketData;

                                          if (cmpDates(
                                                  td.showDate, currentDate) <
                                              0) {
                                            return Column(
                                              children: [
                                                Ticket(
                                                  color: Colors.grey.shade200,
                                                  td: snapshot.data
                                                      as TicketData,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                )
                                              ],
                                            );
                                          } else {
                                            return const SizedBox(
                                              height: 0,
                                            );
                                          }
                                        }*/
                                        return const SizedBox(
                                          height: 0,
                                        );
                                      },
                                    );
                                  });
                            }
                            return const Loading();
                        }
                      })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TicketData {
}

class Ticket extends StatelessWidget {
  final Color color;
  const Ticket({
    Key? key,
    required this.color,
    required this.td,
  }) : super(key: key);
  final TicketData td;
  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: MediaQuery.of(context).size.width,
      child: Container(
        decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color,
              boxShadow: [
                BoxShadow(color: color, spreadRadius: 1),
              ],
            ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "td.movieName",
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    color: KBlackColor,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Emission: le ",
                    style: TextStyle(fontSize: 20, color: KBlackColor),
                  ),
                  Text(
                   " td.showDate" + " à ",
                    style: const TextStyle(fontSize: 20, color: KBlackColor),
                  ),
                  Text(
                    "td.showTime",
                    style: const TextStyle(fontSize: 20, color: KBlackColor),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                     " td.nbTickets.toString()" + " tickets ",
                      textAlign: TextAlign.right,
                      style: const TextStyle(fontSize: 20, color: KBlackColor),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2,)
            ],
          ),
        ),
      ),
    );
  }
}
