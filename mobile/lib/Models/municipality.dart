class municipalityModel {
  int id = 0;
  String name = ' ';
  int idAdresse = 0;
  String rue = ' ';
  String ville = ' ';
  String codePostale = ' ';

  UserApp(
    int ID,
    String name,
  ) {
    this.id = ID;
    this.name = name;
    this.idAdresse = idAdresse;
     this.rue = rue;
    this.ville = ville;
    this.codePostale = codePostale;
  }

  municipalityModel.empty();
  municipalityModel.fromMap(Map<dynamic, dynamic> map) {
    id = map["id"] ?? '';
    name = map['nom'] ?? '';
    idAdresse = map["adresse"]["id"] ?? '';
    rue = map["adresse"]["rue"] ?? '';
    ville = map["adresse"]["ville"] ?? '';
    codePostale = map["adresse"]["codePostale"] ?? '';
  }

  Map<dynamic, dynamic> ServiceToMap(municipalityModel s) {
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = s.id;
    data['nom'] = s.name;

    return data;
  }
}
