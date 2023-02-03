import 'package:flutter/material.dart';

// Connexion methode

class Urls
{
   static String server_name = "afrisofttech-003-site37.btempurl.com";

  static String connectUser(String user_name, String password)
  {
    String api_url = "http://"+server_name+"/api/Utilisateur/getUTILISATEUR?NomUtilisateur="+user_name+"&MotDepasse="+password;
    return api_url;
  }
}