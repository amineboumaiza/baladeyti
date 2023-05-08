

import 'package:shared_preferences/shared_preferences.dart';

import '../../Models/Personne.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class UserServices {


  //get user personal info using ID
  Future<UserApp> getUserInfo(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
      var url = Uri.parse('http://10.0.2.2:8080/profile');
     String ? jwt=  prefs.getString('jwt');
          String ? refreshToken=  prefs.getString('refreshToken');
        var cookieValue = 'jwt=$jwt; refreshToken=$refreshToken';
        print('jwt ');
print(jwt);
        print('refreshToken ');
print(refreshToken);
print(cookieValue);
  var headers = {'Cookie': cookieValue};

    late UserApp user;
        final response = await http.get(url, headers: headers);
      print(response.statusCode);

    if (response.statusCode == 200) {
                    print("yess ");

      Map<String, dynamic> res = json.decode(response.body) as Map<String, dynamic>;
      print(res);
       user = UserApp.fromMap(res);
              prefs.setInt('UserID', user.id);
              print("UserID ");
        print(user.id);
      return user;
      //     return res['token'] as String;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      print("noon get user info");
      throw Exception();
    }

  }

  //get user personal info using ID
  // Future<UserApp> getUserInfoFromMail(String mail) async {
  //   return await UserColl.where('e-mail', isEqualTo: mail).get().then((value) =>
  //       value.docs
  //           .map((e) => UserApp.fromJSON(e.data() as Map<String, dynamic>))
  //           .first);
  // }
// get User tickets history
//get all doc with userid == id
  // Future<int> getUserTicketnb(String id) async {

  //   var a = await TicketColl.where('userId', isEqualTo: id).get().then(
  //       (value) => value.docs
  //           .map((e) => Ticket.fromJSON(e.data() as Map<String, dynamic>))
  //           .toList());
  //   int nbTicket = 0; //all ticket that the user buy
  //   for (var item in a) {
  //     nbTicket += item.nbTicket;
  //   }
  //   print("Ticket number is :");
  //   print(nbTicket);
  //   return nbTicket;
  // }

  // Future<int> getUsernbMovies(String id) async {
  //   Map<String, dynamic> b;
  //   var a = await TicketColl.where('userId', isEqualTo: id)
  //       .get()
  //       .then((value) => value.docs.map((e) {
  //             b = e.data() as Map<String, dynamic>;
  //             return b['showId'].toString();
  //           }).toSet()); //get a set of unique showId
  //   Set<String> c = <String>{};
  //   String d;
  //   for (var i = 0; i < a.length; i++) {
  //     d = await ShowColl.doc(a.elementAt(i))
  //         .get()
  //         .then((value) => value['movieId'].toString());
  //     c.add(d);
  //   }
  //   print("Movies number is :");
  //   print(c.length);
  //   return c.length;
  // }

  // Future<UserApp?> addUser(UserApp user) async {
  //   try {
  //     await UserColl.doc(user.userUID)
  //         .set(UserApp().userToMap(user))
  //         .whenComplete(() => print("user is saved !"));
  //     return user;
  //   } on Exception catch (_, e) {
  //     print(e);
  //   }
  //   return null;
  // }

  // //update user
  // Future<UserApp?> updateUser(UserApp user) async {
  //   try {
  //     await UserColl.doc(user.userUID)
  //         .set(UserApp().userToMap(user))
  //         .whenComplete(() => print("user is updated !"));
  //     return user;
  //   } on Exception catch (_, e) {
  //     print(e);
  //   }
  //   return null;
  // }

  //get List of TicketData of one user

//   Future<List<Future<TicketData>>> getListTicketData(String idUser) async {
//     var a = await TicketColl.where('userId', isEqualTo: idUser)
//         .get()
//         .then((value) => value.docs.map((docTicket) async {
//               TicketData tempdata = TicketData();
//               tempdata.nbTickets = docTicket['nbTickets'] as int;
//               await ShowColl.doc(docTicket['showId'] as String)
//                   .get()
//                   .then((docShow) async {
//                 tempdata.showDate = docShow['diffDate'];
//                 tempdata.showTime = docShow['startTime'];
//                 await MovieColl.doc(docShow['movieId'] as String)
//                     .get()
//                     .then((docMovie) {
//                   tempdata.movieName = docMovie['movieName'] as String;
//                   return null;
//                 });
//                 return null;
//               });
//               return tempdata;
//             }).toList());
//     return a;
// /*     for (var item in a) {
//       print("-------");
//       print(await item.then((value) => value.movieName));
//       print(await item.then((value) => value.showDate) +
//           " " +
//           await item.then((value) => value.showTime));
//       print(await item.then((value) => value.nbTickets));
//       print("-------");
//     } */
//   }
}