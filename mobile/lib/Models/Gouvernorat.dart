class GouvernoratModel {
  int id = 0;
  String name = ' ';

  UserApp(
    int ID,
    String name,
  ) {
    this.id= ID;
    this.name = name;
  }
  GouvernoratModel.empty();
  GouvernoratModel.fromMap(Map<dynamic, dynamic> map) {
    id = map["idGouvernorat"] ?? '';
    name = map['name'] ?? '';
  }


  Map<dynamic, dynamic> ServiceToMap(GouvernoratModel s) {
    Map<String, dynamic> data = <String, dynamic>{};
    data['idGouvernorat'] = s.id;
        data['name'] = s.name;

    return data;
  }
}