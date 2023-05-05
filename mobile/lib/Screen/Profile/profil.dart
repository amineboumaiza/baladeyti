import 'package:flutter/material.dart';

import '../../Constant.dart';
import '../Authentication/SignIn.dart';
import '../Widget/Loading.dart';
import '../Widget/cardFilmTicket.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  String uID = '';
  /*
  UserApp _user = UserApp();

  Future<UserApp> getUserById(String id) async {
    return await UserServices().getUserInfo(id);
  }
*/
  @override
  void initState() {
    super.initState();
   /* SharedPreferences.getInstance().then((prefValue) => {
          setState(() {
            uID = prefValue.getString('UserID') ?? "#####";
          })
        }
        );*/
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Future logOut() {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Center(child: Text('Deconnexion')),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Vous êtes sur le point de vous déconnecter ?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                  child: const Text('Annuler'),
                  onPressed: () {
                    print('alert dissmiss');
                    Navigator.pop(context);
                  }),
              TextButton(
                child: const Text('Déconnecter'),
                onPressed: () async {
                  print('you are loged out !!!');
                 // await AuthService().logout();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const signIn()),
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
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: TextButton(

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text("Deconnexion ",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                        Icon(Icons.logout)
                      ],
                    ),
                    onPressed: () {
                      logOut();
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: FutureBuilder(
                 // future: UserServices().getUserInfo(uID),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return const Text('No connection with data base !!!');
                      case ConnectionState.waiting:
                      return const Center(child: Loading());
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
                        //  _user = snapshot.data as UserApp;
                          return Column(
                            children: [
                              Stack(
                                children: [
                                  ClipOval(
                                    child: Material(
                                      color: Colors.transparent,
                                      child: Ink.image(
                                        image: NetworkImage(
                                           "_user.userAvatar.toString()"),
                                        width: 200,
                                        height: 200,
                                        fit: BoxFit.cover,
                                        child: InkWell(
                                          onTap: () {},
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Text(
                               " _user.userName + ' ' + _user.userLastName",
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: KBlackColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          );
                        }
                        return const Center(
                          child: Text("Missing Data"),
                        );
                    }
                  }),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              icon: const Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Icon(
                  Icons.settings,
                  color: KWihteColor,
                  size: 27.0,
                ),
              ),
              label: const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                child: Text(
                  'Modifier mes coordonnées',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              onPressed: () {
                //_user.userUID = uID;
             /*   Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChangeInfo(
                            passedUser: _user,
                          )),
                ); */
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.grey.shade400,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder(
             //     future: UserServices().getUsernbMovies(uID),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return const Text('No connection with data base !!!');
                      case ConnectionState.waiting:
                        return const Center(child: Loading());
                      default:
                        return cardFilm_ticket(
                          size: size,
                          text: snapshot.data.toString() + ' Films',
                          color: KPinkColor,
                        );
                    }
                  },
                ),
                const SizedBox(
                  width: 30,
                ),
                FutureBuilder(
                //  future: UserServices().getUserTicketnb(uID),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return const Text('No connection with data base !!!');
                      case ConnectionState.waiting:
                     //   return const Center(child: Loading());
                      default:
                        return cardFilm_ticket(
                          size: size,
                          text: snapshot.data.toString() + ' Tickets',
                          color: Colors.lightBlue.shade200,
                        );
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
