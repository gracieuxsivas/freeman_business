/*
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
import 'dart:convert';

import '../utilits/Urls.dart';
import 'package:http/http.dart' as http;

/*
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class DossierPVmod {
  String? codePV;
  String? designationPv;
  String? numCompte;
  String? compte;
  int? charge;
  String? numeroDeclaration;
  String? plaque;
  String? autreNumero;
  String? detailPV;
  int? facturation;
  int? resultat;
  String? datePv;

  DossierPVmod({this.codePV,
    this.designationPv,
    this.numCompte,
    this.compte,
    this.charge,
    this.numeroDeclaration,
    this.plaque,
    this.autreNumero,
    this.detailPV,
    this.facturation,
    this.resultat,
    this.datePv});

  DossierPVmod.fromJson(Map<String, dynamic> json) {
    codePV = json['codePV'];
    designationPv = json['designationPv'];
    numCompte = json['numCompte'];
    compte = json['compte'];
    charge = json['charge'];
    numeroDeclaration = json['numeroDeclaration'];
    plaque = json['plaque'];
    autreNumero = json['autreNumero'];
    detailPV = json['detailPV'];
    facturation = json['facturation'];
    resultat = json['resultat'];
    datePv = json['datePv'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['codePV'] = codePV;
    data['designationPv'] = designationPv;
    data['numCompte'] = numCompte;
    data['compte'] = compte;
    data['charge'] = charge;
    data['numeroDeclaration'] = numeroDeclaration;
    data['plaque'] = plaque;
    data['autreNumero'] = autreNumero;
    data['detailPV'] = detailPV;
    data['facturation'] = facturation;
    data['resultat'] = resultat;
    data['datePv'] = datePv;
    return data;
  }

  static Future<List<DossierPVmod>> getPVDossier(String numDossier) async {
    var url = Urls.adresseServeur +
        "/api/Dossier/GetleDossierParDossier?NumDossier=$numDossier";
    var data = await http.get(
        Uri.parse(url));
    var t = [];
    t = json.decode(data.body);
    return t.map((e) => DossierPVmod.fromJson(e)).toList();
  }
}


