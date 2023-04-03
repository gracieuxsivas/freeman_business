/*
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/

import 'dart:convert';

import '../../utilits/Urls.dart';
import 'package:http/http.dart' as http;


class CreateNewDossier {
  int? idDossier;
  String? numDossier;
  String? designationDossier;
  bool? etat;

  CreateNewDossier(
      {this.idDossier,
        this.numDossier,
        this.designationDossier,
        this.etat});

  CreateNewDossier.fromJson(Map<String, dynamic> json) {
    idDossier = json['idDossier'];
    numDossier = json['numDossier'];
    designationDossier = json['designationDossier'];
    etat = json['etat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['idDossier'] = idDossier;
    data['numDossier'] = numDossier;
    data['designationDossier'] = designationDossier;
    data['etat'] = etat;
    return data;
  }

}

