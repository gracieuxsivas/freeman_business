import 'dart:convert';

import 'package:freeman_business/Server/Urls.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class User
{

  int? idUtilisateur, compte, compteDeclaration, actif;
  String? nomUtilisateur, designationUt, motPasseUtilisateur, fonctionUt, serviceAffe;


  User(this.idUtilisateur, this.compte, this.compteDeclaration, this.actif,
      this.nomUtilisateur, this.designationUt, this.motPasseUtilisateur,
      this.fonctionUt, this.serviceAffe);

  static Future getConnexionUtilisateur(String username, String password) async {
    var url = Uri.parse(Urls.connectUser(username, password));
    var data = await http.get(url);

    var t = [];
    //final Map<String, dynamic> t;
    t = json.decode(data.body);
    List<User> userList  =
    List<User>.from(t.map((model) => User.fromJson(model)));

    return userList;
  }

  User.fromJson(Map<String, dynamic> json) {
    idUtilisateur = json['idUtilisateur'];
    compte = json['compte'];
    compteDeclaration = json['compteDeclaration'];
    actif = json['actif'];
    nomUtilisateur = json['nomUtilisateur'];
    designationUt = json['designationUt'];
    motPasseUtilisateur = json['motPasseUtilisateur'];
    fonctionUt = json['fonctionUt'];
    serviceAffe = json['serviceAffe'];
  }
}