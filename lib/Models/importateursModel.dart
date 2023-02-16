
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utilits/Urls.dart';

class ImportateurModel {
  int? groupeCompte;
  String? designationGroupe;
  int? numCompte;
  String? designationCompte;
  int? solde;
  int? nombre;
  DateTime? dateOperation;

  ImportateurModel(
      {this.groupeCompte,
        this.designationGroupe,
        this.numCompte,
        this.designationCompte,
        this.solde,
        this.nombre,
        this.dateOperation});

  ImportateurModel.fromJson(Map<String, dynamic> json) {
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

  static Future<List<ImportateurModel>> getImportateurModel(int import) async {
    var url = Urls.adresseServeur + "/api/Balance/GetlaBalanceParGoupe?GroupeCompte=$import";
    //var url = "http://afrisofttech-003-site37.btempurl.com/api/Balance/GetlaBalanceParGoupe?GroupeCompte=411";
    var data = await http.get(
        Uri.parse(url));
    var t = [];
    t = json.decode(data.body);
    return t.map((e) => ImportateurModel.fromJson(e)).toList();
  }

}

