/*
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utilits/Urls.dart';

class ResultatReleveModel {
  String? numeroOperation;
  String? designationOperation;
  String? numCompte;
  String? designationCompte;
  String? details;
  String? lot;
  String? designationLot;
  String? detailFacture;
  int? debit;
  int? credit;
  int? qte;
  int? entree;
  int? solde;
  String ? dateOperation;

  ResultatReleveModel(
      {this.numeroOperation,
        this.designationOperation,
        this.numCompte,
        this.designationCompte,
        this.details,
        this.lot,
        this.designationLot,
        this.detailFacture,
        this.debit,
        this.credit,
        this.qte,
        this.entree,
        this.solde,
        this.dateOperation});

  ResultatReleveModel.fromJson(Map<String, dynamic> json) {
    numeroOperation = json['numeroOperation'];
    designationOperation = json['designationOperation'];
    numCompte = json['numCompte'];
    designationCompte = json['designationCompte'];
    details = json['details'];
    lot = json['lot'];
    designationLot = json['designationLot'];
    detailFacture = json['detailFacture'];
    debit = json['debit'];
    credit = json['credit'];
    qte = json['qte'];
    entree = json['entree'];
    solde = json['solde'];
    dateOperation = json['dateOperation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['numeroOperation'] = numeroOperation;
    data['designationOperation'] = designationOperation;
    data['numCompte'] = numCompte;
    data['designationCompte'] = designationCompte;
    data['details'] = details;
    data['lot'] = lot;
    data['designationLot'] = designationLot;
    data['detailFacture'] = detailFacture;
    data['debit'] = debit;
    data['credit'] = credit;
    data['qte'] = qte;
    data['entree'] = entree;
    data['solde'] = solde;
    data['dateOperation'] = dateOperation;
    return data;
  }

  /**
   *RELEVE_RESULTAT_PAR_MOIS
   */
  static Future<List<ResultatReleveModel>> getResultatParMoisReleve(String? Compte, String mois, int annee) async {

    var url = Urls.adresseServeur + "/api/Balance/GetDetailResultatDuMoiParCodeExercice?NumCompte=$Compte&moi=$mois&year=$annee";
    print(url);
    var data = await http.get(
        Uri.parse(url));
    var t = [];
    t = json.decode(data.body);
    return t.map((e) => ResultatReleveModel.fromJson(e)).toList();
  }
}

