class UserApp {
  int id = 0;
  String name = ' ';
  String lastName = '';
  String email = '';


  UserApp(
    String usermail,
    String username,
    String userlastname,
    String userBirthDate,
    String userphone,

  ) {
    this.name = username;
    this.lastName = userlastname;
    this.email = usermail;

  }

  UserApp.empty();

  UserApp.fromMap(Map<String, dynamic> map) {
    id = map["id"] ?? '';
    name = map['nom'] ?? '';
    lastName = map['prenom'] ?? '';
    email = map['email'] ?? '';
  }

  set userMail(String userMail) {}

  Map<String, dynamic> userToMap(UserApp user) {
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = user.id;
    data['nom'] = user.name;
    data['prenom'] = user.lastName;
    data['email'] = user.email;


    return data;
  }
}