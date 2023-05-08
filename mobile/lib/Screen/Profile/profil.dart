import 'package:flutter/material.dart';

import '../../Constant.dart';
import '../../Models/Personne.dart';
import '../../Services/UserServices/UserServices.dart';
import '../Authentication/SignIn.dart';
import '../Widget/Loading.dart';
import '../Widget/cardFilmTicket.dart';
import 'ChangeInfo.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  String uID = '';
late  UserApp _user ;
  Future<UserApp> getUserById(String id) async {
     _user =  await UserServices().getUserInfo(id);
     print('yemchyy ! ');
    return  ( _user);
  }

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
                 future: UserServices().getUserInfo(uID),
                  builder: (context, snapshot) {
                  
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              '${snapshot.error} occured',
                              style: const TextStyle(fontSize: 18),
                            ),
                          );

                          // if we got our data
                        } else if (snapshot.hasData) {
                         _user = snapshot.data as UserApp;
                          return Column(
                            children: [
                              Stack(
                                children: [
                                    Image.asset(
                  "assets/profilAvatar.jpg",
                  height: size.width * 0.2,
                ),
                                ],
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Text(
                                _user.name + ' ' + _user.lastName,
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: KBlackColor,
                                    fontWeight: FontWeight.bold),
                              ),
                                     const SizedBox(
                                height: 40,
                              ),
                              Text(
                                _user.email + ' ' ,
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
               
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChangeInfo(
                            passedUser: _user,
                          )),
                ); 
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

          ],
        ),
      ),
    );
  }
}
