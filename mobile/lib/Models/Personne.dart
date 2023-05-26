class UserApp {
  int id = 0;
  String name = ' ';
  String lastName = '';
  String email = '';
  String role = '';


  UserApp(
    int ID,
    String usermail,
    String username,
    String userlastname,
    String userRole,

  ) {
    this.id= ID;
    this.name = username;
    this.lastName = userlastname;
    this.email = usermail;
      this.role = userRole;


  }

  UserApp.empty();

  UserApp.fromMap(Map<dynamic, dynamic> map) {
    id = map["id"] ?? '';
    name = map['nom'] ?? '';
    lastName = map['prenom'] ?? '';
    email = map['email'] ?? '';
    role=map['role']?? '';
  }

  set userMail(String userMail) {}

  Map<dynamic, dynamic> userToMap(UserApp user) {
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = user.id;
    data['nom'] = user.name;
    data['prenom'] = user.lastName;
    data['email'] = user.email;
    data['role'] = user.role;
    return data;
  }
}