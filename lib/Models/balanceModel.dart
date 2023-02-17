
/*
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/

import 'dart:convert';

import 'package:freeman_business/utilits/Urls.dart';
import 'package:http/http.dart' as http;
import '../utilits/Urls.dart';

class BalanceModel {
  int? groupeCompte;
  String? designationGroupe;
  int? numCompte;
  String? designationCompte;
  int? solde;
  int? nombre;
  DateTime? dateOperation;

  BalanceModel(
      {this.groupeCompte,
        this.designationGroupe,
        this.numCompte,
        this.designationCompte,
        this.solde,
        this.nombre,
        this.dateOperation});

  BalanceModel.fromJson(Map<String, dynamic> json) {
    groupeCompte = json['groupeCompte'];
    designationGroupe = json['designationGroupe'];
    numCompte = json['numCompte'];
    designationCompte = json['designationCompte'];
    solde = json['solde'];
    nombre = json['nombre'];
    dateOperation = json['dateOperation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['groupeCompte'] = groupeCompte;
    data['designationGroupe'] = designationGroupe;
    data['numCompte'] = numCompte;
    data['designationCompte'] = designationCompte;
    data['solde'] = solde;
    data['nombre'] = nombre;
    data['dateOperation'] = dateOperation;
    return data;
  }

  static Future<List<BalanceModel>> getBalancedeGroupe() async {
    var url = Urls.adresseServeur + "/api/Balance/GetlaBalancedeGroupe";
    var data = await http.get(
        Uri.parse(url));
    print(data.body);
    var t = [];
    t = json.decode(data.body);
    return t.map((e) => BalanceModel.fromJson(e)).toList();
  }
}

