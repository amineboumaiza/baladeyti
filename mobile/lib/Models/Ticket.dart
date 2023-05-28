class ticketModel {
  int id = 0;
  String num = ' ';
  String date = ' ';
  String etat = ' ';
  int idService = 0;
  int idMunicipalite = 0;
  int idGouvernorat = 0;


  ticketModel(
    int ID,
    String Num , 
  ) {
    this.id = ID;
    this.num = Num;
  }

  ticketModel.empty();
  ticketModel.fromMap(Map<dynamic, dynamic> map) {
    id = map["id"] ?? '';
    num = map['num'] ?? '';
    date = map["date"] ?? '';
    etat = map["etat"] ?? '';
    idService = map["idService"]["id"] ?? '';
    idMunicipalite = map["idMunicipalite"]["id"] ?? '';
    idGouvernorat = map["idMunicipalite"]["gouvernorat"]["idGouvernorat"] ?? '';
  }

  //Map<dynamic, dynamic> ServiceToMap(ticketModel s) {
  //   Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = s.id;
  //   data['num'] = s.num;

  //   return data;
  // }
}
