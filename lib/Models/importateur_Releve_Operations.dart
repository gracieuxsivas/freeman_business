/*
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
import 'dart:convert';

import '../utilits/Urls.dart';

import 'package:http/http.dart' as http;

class ImportReleveOperation {
  int? numCompte;
  String? designationCompte;
  String? numOperation;
  int? qte;
  int? debit;
  int? credit;

  ImportReleveOperation(
      {this.numCompte,
        this.designationCompte,
        this.numOperation,
        this.qte,
        this.debit,
        this.credit});

  ImportReleveOperation.fromJson(Map<String, dynamic> json) {
    numCompte = json['numCompte'];
    designationCompte = json['designationCompte'];
    numOperation = json['numOperation'];
    qte = json['qte'];
    debit = json['debit'];
    credit = json['credit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['numCompte'] = numCompte;
    data['designationCompte'] = designationCompte;
    data['numOperation'] = numOperation;
    data['qte'] = qte;
    data['debit'] = debit;
    data['credit'] = credit;
    return data;
  }
  /** DETAIL OPERATION RELEVE  */

  static Future<List<ImportReleveOperation>> getDetailReleveOperation(String NumOp) async {
    var url = Urls.adresseServeur + "/api/Operation/GetDetail?NumeroOperation= $NumOp";
    print(url);
    var data = await http.get(
        Uri.parse(url));
    var t = [];
    t = json.decode(data.body);
    return t.map((e) => ImportReleveOperation.fromJson(e)).toList();
  }
}

