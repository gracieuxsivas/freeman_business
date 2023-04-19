
/*
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/

import 'dart:convert';
import '../../utilits/Urls.dart';
import 'package:http/http.dart' as http;

class ListeGroupeCompte {
  int? numCompte;
  String? designationCompte;
  int? groupeCompte;
  int? unite;
  String? solde;

  ListeGroupeCompte(
      {this.numCompte,
        this.designationCompte,
        this.groupeCompte,
        this.unite,
        this.solde});

  ListeGroupeCompte.fromJson(Map<String, dynamic> json) {
    numCompte = json['numCompte'];
    designationCompte = json['designationCompte'];
    groupeCompte = json['groupeCompte'];
    unite = json['unite'];
    solde = json['solde'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['numCompte'] = numCompte;
    data['designationCompte'] = designationCompte;
    data['groupeCompte'] = groupeCompte;
    data['unite'] = unite;
    data['solde'] = solde;
    return data;


  }

  static Future<List<ListeGroupeCompte>> getComptes(int numCompte) async {
    var url = Urls.adresseServeur + "/api/Compte/listedeCompteParGroupe?groupeCompte=$numCompte";
    var data = await http.get(
        Uri.parse(url));
    var t = [];
    t = json.decode(data.body);
    return t.map((e) => ListeGroupeCompte.fromJson(e)).toList();

  // static Future<double> Comptes(int numCompte) async {
  //   var url = Urls.adresseServeur + "/api/Compte/listedeCompteParGroupe?groupeCompte=$numCompte";
  //   var data = await http.get(
  //       Uri.parse(url));
  //   return double.parse(data.body.toString());
  }

}

