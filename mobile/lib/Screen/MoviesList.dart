// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';

import '../Constant.dart';
import 'Widget/AppBarMc.dart';
import 'Widget/Loading.dart';


class MoviesList extends StatefulWidget {
  const MoviesList({Key? key}) : super(key: key);

  @override
  State<MoviesList> createState() => _MoviesListState();
}

enum WidgetMarker { ALL, ByDate }
String rakahdate(DateTime d) {
  String ch = d.toString();
  String ch2 =
      ch[8] + ch[9] + '-' + ch[5] + ch[6] + '-' + ch[0] + ch[1] + ch[2] + ch[3];
  return ch2;
}

class _MoviesListState extends State<MoviesList> {
  Color c1 = KPrimaryColor;
  Color c2 = KSecondaryColor;
  WidgetMarker selectedWidgetMarker = WidgetMarker.ALL;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Widget getAllMovies() {
      return FutureBuilder(
       //   future: MoviesServices().getAllMoviesDetailes(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Text(
                    'Pas de connexion avec la base de données !!!');
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
                } else {
                 // final lm = snapshot.data as List<Future<Movie>>;
                  //all good to this point
                  return RefreshIndicator(
                    onRefresh: () async {
                      setState(() {
                        print("refreched");
                      });
                    },
                    child: ListView.builder(
                        shrinkWrap: true,
                     //   itemCount: lm.length,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return FutureBuilder(
                             // future: lm[index],
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  return Center(
                                    child: Text(
                                      '${snapshot.error} occured',
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  );
                                }
                            /*    if (snapshot.hasData) {
                                  Movie m = snapshot.data as Movie;
                                  return cardPhoto(
                                    size: size,
                                    theMovie: m,
                                  );
                                }*/
                                return const Loading();
                              });
                        }),
                  );
                }
            }
          });
    }

    Widget getCustomContainer() {
      switch (selectedWidgetMarker) {
        case WidgetMarker.ALL:
          return getAllMovies();

        case WidgetMarker.ByDate:
          return getByDateMovie();
        default:
          return getAllMovies();
      }
    }

    return Material(
      child: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              print("refreched");
            });
          },
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  AppBarMc(size: size), // search + logo
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextButton(
                          /* color: c1,
                            textColor: KWihteColor,
                            minWidth: 120,*/
                            onPressed: () {
                              setState(() {
                                selectedWidgetMarker = WidgetMarker.ALL;
                                c1 = KPrimaryColor;
                                c2 = KSecondaryColor;
                              });
                            },
                            child: const Text(
                              "Tous",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          TextButton(
                         /*   color: c2,
                            textColor: KWihteColor,
                            minWidth: 120,*/
                            child: const Text(
                              "Selon date",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                            onPressed: () {
                              setState(() {
                                selectedWidgetMarker = WidgetMarker.ByDate;
                                c2 = KPrimaryColor;
                                c1 = KSecondaryColor;
                              });
                            },
                          ),
                        ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
              getCustomContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types

class getByDateMovie extends StatefulWidget {
  const getByDateMovie({
    Key? key,
  }) : super(key: key);

  @override
  State<getByDateMovie> createState() => _getByDateMovieState();
}

class _getByDateMovieState extends State<getByDateMovie> {
  String date_m = '';
  void intiState() {
    super.initState();
    date_m = rakahdate(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        ElevatedButton.icon(
          icon: const Icon(
            Icons.calendar_today,
            color: KBlackColor,
            size: 24.0,
          ),
          label: const Text(
            'Choisir une date',
            style: TextStyle(color: KBlackColor, fontSize: 17),
          ),
          onPressed: () {
          /*  DatePicker.showDatePicker(context,
                showTitleActions: true,
                minTime: DateTime(2018, 3, 5),
                maxTime: DateTime(2030, 6, 7), onChanged: (date) {
              date_m = rakahdate(date);
            }, onConfirm: (date) {
              setState(() {
                date_m = rakahdate(date);
              });
            }, currentTime: DateTime.now(), locale: LocaleType.fr);*/
          },
          style: ElevatedButton.styleFrom(
            primary: KSecondaryColor,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20.0),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      /*  SingleChildScrollView(
          child: (date_m.isEmpty)
              ? WaitingInput()
              : FutureBuilder(
                  future: MoviesServices().getMovieByDate(date_m),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return const Text(
                            'Pas de connexion avec la base de données !!!');
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
                        }
                        if (date_m.isNotEmpty && !snapshot.hasData) {
                          return NoResult();
                        } else {
                          if (snapshot.hasData) {
                            final lm = snapshot.data as List<Movie>;
                            //all good to this point
                            return ListView.builder(
                                physics: const ClampingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: lm.length,
                                itemBuilder: (BuildContext context, int index) {
                                  Movie m = lm[index];
                                  return cardPhoto(
                                    size: size,
                                    theMovie: m,
                                  );
                                });
                          }
                        }
                        return const Loading();
                    }
                  }),
        ),*/
      ],
    );
  }
}
