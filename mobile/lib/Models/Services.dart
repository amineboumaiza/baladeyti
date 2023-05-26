class ServiceModel {
  int id = 0;
  String name = ' ';

  UserApp(
    int ID,
    String name,
  ) {
    this.id= ID;
    this.name = name;
  }
  ServiceModel.empty();
  ServiceModel.fromMap(Map<dynamic, dynamic> map) {
    id = map["id"] ?? '';
    name = map['nom'] ?? '';
  }


  Map<dynamic, dynamic> ServiceToMap(ServiceModel s) {
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = s.id;
        data['nom'] = s.id;

    return data;
  }
}