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
  double? charge;
  double? produit;
  double? rsultat;
  double? rendemnt;
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
    charge = double.parse(json['charge'].toString());
    produit = double.parse(json['produit'].toString());
    rsultat = double.parse(json['rsultat'].toString());
    rendemnt = double.parse(json['rendemnt'].toString());
    groupeCompte = json['groupeCompte'];
    codeExercice = json['codeExercice'];
    designationGroupe = json['designationGroupe'].toString();
    numCompte = json['numCompte'].toString();
    designationCompte = json['designationCompte'].toString();
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
    var url = Urls.adresseServeur + "/api/Resultat/GetlesResultatParExercice?year=$resultatParAn";
    print(url);
    var data = await http.get(
        Uri.parse(url));
    var t = [];
    t = json.decode(data.body);
    return t.map((e) => ResultatModel.fromJson(e)).toList();
  }


  /**RESULTAT PAR MOIS  */

  static Future<List<ResultatModel>> getResultatParMois(String mois, int annee) async {
    var url = Urls.adresseServeur + "/api/Resultat/GetlesResultaDetaillePourUnmoiParCodeExercice?moi=$mois&year=$annee";
    print(url);
    var data = await http.get(
        Uri.parse(url));
    var t = [];
    t = json.decode(data.body);
    return t.map((e) => ResultatModel.fromJson(e)).toList();
  }

}

