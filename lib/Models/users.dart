
import 'dart:convert';

import 'package:freeman_business/utilits/Urls.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Users {
  int? idUtilisateur;
  String? nomUtilisateur;
  String? designationUt;
  String? motPasseUtilisateur;
  String? fonctionUt;
  String? serviceAffe;
  int? compte;
  int? compteDeclaration;
  int? actif;

  Users(
      {this.idUtilisateur,
        this.nomUtilisateur,
        this.designationUt,
        this.motPasseUtilisateur,
        this.fonctionUt,
        this.serviceAffe,
        this.compte,
        this.compteDeclaration,
        this.actif});

  Users.fromJson(Map<String, dynamic> json) {
    idUtilisateur = json['idUtilisateur'];
    nomUtilisateur = json['nomUtilisateur'];
    designationUt = json['designationUt'];
    motPasseUtilisateur = json['motPasseUtilisateur'];
    fonctionUt = json['fonctionUt'];
    serviceAffe = json['serviceAffe'];
    compte = json['compte'];
    compteDeclaration = json['compteDeclaration'];
    actif = json['actif'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idUtilisateur'] = this.idUtilisateur;
    data['nomUtilisateur'] = this.nomUtilisateur;
    data['designationUt'] = this.designationUt;
    data['motPasseUtilisateur'] = this.motPasseUtilisateur;
    data['fonctionUt'] = this.fonctionUt;
    data['serviceAffe'] = this.serviceAffe;
    data['compte'] = this.compte;
    data['compteDeclaration'] = this.compteDeclaration;
    data['actif'] = this.actif;
    return data;
  }


  /**
   * connexion de l'utilisateur
   */
  static Future<List<Users>> getConnexionUsers(
      String NomUtilisateur,String password) async {
    var url = Urls.adresseServeur + "/api/Utilisateur/GetUser?NomUtilisateur=$NomUtilisateur&MotDepasse=$password";
    var data = await http.get(
        Uri.parse(url));
    print(data.body);
    var t = [];
    t = json.decode(data.body);
    return t.map((e) => Users.fromJson(e)).toList();
  }



  static saveUserPrefs(Users value) async {
    //enregistrement de la session de l'utilisateur en cours
    final prefs = await SharedPreferences.getInstance();

    prefs.setString("currentUsers", json.encode(value));
    prefs.setBool("loggedIn", true);
    prefs.setBool("isAdresseIp", true);

  }

  static Future getCurrentUsers() async {
    //recuperation des informations de l'utilisateur en cours
    final prefs = await SharedPreferences.getInstance();
    String? user = prefs.getString("currentUsers");
    return Users.fromJson(json.decode(user!));
  }

  static deconnexionUserPref() async {
    //deconnexion de l'utilisateur
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("currentUsers");
    prefs.setBool("loggedIn", false);
  }
}
