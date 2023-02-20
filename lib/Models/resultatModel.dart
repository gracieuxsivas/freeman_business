/*
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utilits/Urls.dart';

class ResultatModel {
  String? periode;
  int? charge;
  int? produit;
  int? rsultat;
  int? rendemnt;
  int? groupeCompte;
  int? codeExercice;
  String? designationGroupe;
  String? numCompte;
  String? designationCompte;

  ResultatModel(
      {this.periode,
        this.charge,
        this.produit,
        this.rsultat,
        this.rendemnt,
        this.groupeCompte,
        this.codeExercice,
        this.designationGroupe,
        this.numCompte,
        this.designationCompte});

  ResultatModel.fromJson(Map<String, dynamic> json) {
    periode = json['periode'];
    charge = json['charge'];
    produit = json['produit'];
    rsultat = json['rsultat'];
    rendemnt = json['rendemnt'];
    groupeCompte = json['groupeCompte'];
    codeExercice = json['codeExercice'];
    designationGroupe = json['designationGroupe'];
    numCompte = json['numCompte'];
    designationCompte = json['designationCompte'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['periode'] = periode;
    data['charge'] = charge;
    data['produit'] = produit;
    data['rsultat'] = rsultat;
    data['rendemnt'] = rendemnt;
    data['groupeCompte'] = groupeCompte;
    data['codeExercice'] = codeExercice;
    data['designationGroupe'] = designationGroupe;
    data['numCompte'] = numCompte;
    data['designationCompte'] = designationCompte;
    return data;
  }

  static Future<List<ResultatModel>> getResultat(int resultatParAn) async {
    var url = Urls.adresseServeur + "/api/Resultat/GetlesResultatParExercice?year=2022";
    print(url);
    var data = await http.get(
        Uri.parse(url));
    var t = [];
    t = json.decode(data.body);
    return t.map((e) => ResultatModel.fromJson(e)).toList();
  }
}

