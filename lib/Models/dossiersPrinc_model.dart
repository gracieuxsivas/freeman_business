/*
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
import 'dart:convert';

import '../utilits/Urls.dart';
import 'package:http/http.dart' as http;


class Dossier {
  int? idDossier;
  String? numDossier;
  String? designationDossier;
  bool? etat;

  Dossier(
      {this.idDossier,
        this.numDossier,
        this.designationDossier,
        this.etat});

  Dossier.fromJson(Map<String, dynamic> json) {
    idDossier = json['idDossier'];
    numDossier = json['numDossier'];
    designationDossier = json['designationDossier'];
    etat = json['etat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['idDossier'] = idDossier;
    data['numDossier'] = numDossier;
    data['designationDossier'] = designationDossier;
    data['etat'] = etat;
    return data;
  }
  static Future<List<Dossier>> getDossiers(int etat) async {
    var url = Urls.adresseServeur + "/api/Dossier/GetListeDossierPrincipaEncours?Etat=$etat";
    var data = await http.get(
        Uri.parse(url));
    var t = [];
    t = json.decode(data.body);
    return t.map((e) => Dossier.fromJson(e)).toList();
  }


  /*
  enregistrement dossier
   */
  static Future<String> enregistrement(Dossier dossier) async {
    //envoi des donnees au serveur
    var data = await http.post(
      Uri.parse(Urls.adresseServeur + "/api/Dossier/Create"),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      },
      body: jsonEncode(dossier.toJson()),
    );

    print(data.statusCode.toString());

    return data.statusCode.toString();
  }

}