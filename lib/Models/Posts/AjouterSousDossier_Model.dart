/*
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/

import 'dart:convert';
import '../../utilits/Urls.dart';
import 'package:http/http.dart' as http;

class SousDossier {
  String? codePV;
  String? designationPv;
  String? numeroDeclaration;
  String? plaque;
  String? compte;
  String? autreNumero;
  String? numDossier;
  String? etat;
  String? detailPV;
  String? datePv;

  SousDossier(
      {this.codePV,
        this.designationPv,
        this.numeroDeclaration,
        this.plaque,
        this.compte,
        this.autreNumero,
        this.numDossier,
        this.etat,
        this.detailPV,
        this.datePv});

  SousDossier.fromJson(Map<String, dynamic> json) {
    codePV = json['codePV'];
    designationPv = json['designationPv'];
    numeroDeclaration = json['numeroDeclaration'];
    plaque = json['plaque'];
    compte = json['compte'];
    autreNumero = json['autreNumero'];
    numDossier = json['numDossier'];
    etat = json['etat'];
    detailPV = json['detailPV'];
    datePv = json['datePv'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['codePV'] = codePV;
    data['designationPv'] = designationPv;
    data['numeroDeclaration'] = numeroDeclaration;
    data['plaque'] = plaque;
    data['compte'] = compte;
    data['autreNumero'] = autreNumero;
    data['numDossier'] = numDossier;
    data['etat'] = etat;
    data['detailPV'] = detailPV;
    data['datePv'] = datePv;
    return data;
  }

  /*
  ENREGISTREMENT NOUVEAU DOSSIER/PV
   */
  static Future<String> enregistrement (SousDossier dossierPV) async {
//envoi des donnees au serveur
    var data = await http.post(
      Uri.parse(Urls.adresseServeur + "/api/Pv/Create"),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      },
      body: jsonEncode(dossierPV.toJson()),
    );

    print(data.statusCode.toString());
    return data.statusCode.toString();
  }

}


