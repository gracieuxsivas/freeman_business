/*
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utilits/Urls.dart';

import '../utilits/Urls.dart';

class ImportateurReleveModel {
  String? numeroOperation;
  String? designationOperation;
  int? numCompte;
  String? designationCompte;
  String? details;
  String? lot;
  String? designationLot;
  String? detailFacture;
  double? debit;
  double? credit;
  double? qte;
  int? entree;
  int? solde;
  String? dateOperation;

  ImportateurReleveModel(
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

  ImportateurReleveModel.fromJson(Map<String, dynamic> json) {
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

  /** RELEVE IMPORTATEUR  */
  static Future<List<ImportateurReleveModel>> getReleveImp(int Compte, String date_1, String  date_2) async {
    var url = Urls.adresseServeur + "/api/Balance/GetDetail?NumCompte=$Compte&Date1=$date_1&Date2=$date_2";
    //var url = Urls.adresseServeur + "/api/Balance/GetDetail?NumCompte=41177&Date1=2022-01-11&Date2=2022-02-24";
    print(url);
    var data = await http.get(
        Uri.parse(url));
    var t = [];
    t = json.decode(data.body);
    return t.map((e) => ImportateurReleveModel.fromJson(e)).toList();
  }

/** DETAIL OPERATION RELEVE  */

  static Future<List<ImportateurReleveModel>> getDetailReleveOperation(String NumOp) async {
    var url = Urls.adresseServeur + "/api/Operation/GetDetail?NumeroOperation=$NumOp";
    print(url);
    var data = await http.get(
        Uri.parse(url));
    var t = [];
    t = json.decode(data.body);
    List<ImportateurReleveModel> dataList =  [];
    for(var e in t){

      print(e['designationCompte']);

      ImportateurReleveModel model =
      ImportateurReleveModel(numCompte: e['numCompte'],
        designationCompte :e['designationCompte'].toString(),
        numeroOperation :e['numOperation'].toString(),
        qte :double.parse(e['qte'].toString()),
        credit :double.parse(e['credit'].toString()),
        debit :double.parse(e['debit'].toString()),
      );
      dataList.add(model);
    }return dataList;
  }
}

