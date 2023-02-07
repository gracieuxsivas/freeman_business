import 'dart:convert';

import 'package:freeman_business/utilits/Urls.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class GroupeCompte {

  static int Caisse = 571;
  static int Banque = 521;
  static int importateur=411;
  static int Fournisseur=401;

  int? groupeCompte;
  String? designationGroupe;
  int? numCompte;
  String? designationCompte;
  double? solde;
  int? nombre;
  String? dateOperation;

  GroupeCompte(
      {this.groupeCompte,
        this.designationGroupe,
        this.numCompte,
        this.designationCompte,
        this.solde,
        this.nombre,
        this.dateOperation});

  GroupeCompte.fromJson(Map<String, dynamic> json) {
    groupeCompte = json['groupeCompte'];
    designationGroupe = json['designationGroupe'];
    numCompte = json['numCompte'];
    designationCompte = json['designationCompte'];
    solde = double.parse(json['solde'].toString());
    nombre = json['nombre'];
    dateOperation = json['dateOperation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['groupeCompte'] = this.groupeCompte;
    data['designationGroupe'] = this.designationGroupe;
    data['numCompte'] = this.numCompte;
    data['designationCompte'] = this.designationCompte;
    data['solde'] = this.solde;
    data['nombre'] = this.nombre;
    data['dateOperation'] = this.dateOperation;
    return data;
  }




  static Future<double> getSoldeGroupeCompte(
      int numGroupeCompte) async {
    var url = Urls.adresseServeur + "/api/Accueil/GetsoldeGroupeCompte?groupe=$numGroupeCompte";
    var data = await http.get(
        Uri.parse(url));
    // print(data.body);
    var t ;
    t = json.decode(data.body);
    GroupeCompte groupeCompte = GroupeCompte.fromJson(t);
    return groupeCompte.solde!;
  }


  static Future<double> getFactureImportateur(
      int parameter) async {
    var url = Urls.adresseServeur + "/api/Accueil/PvdelePeriode?TypeDePeriode=$parameter";
    var data = await http.get(
        Uri.parse(url));
    // print(data.body);
    return double.parse(data.body.toString());
  }


  static Future<double> getFraisDossier(
      int parameter) async {
    var url = Urls.adresseServeur + "/api/Accueil/PvdelePeriode?TypeDePeriode=$parameter";
    var data = await http.get(
        Uri.parse(url));
    return double.parse(data.body.toString());
  }
}

