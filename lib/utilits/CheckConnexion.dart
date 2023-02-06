import 'dart:io';

import 'package:freeman_business/utilits/Urls.dart';




class CheckConnexion {
  static Future<String> isConnexionAvailable() async {
    try {
      final result = await InternetAddress.lookup(Urls.adresseServeurToCheck);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return "true";
      }
      return "";
    } on SocketException catch (_) {
      return "";
    }
  }

  static Future<String> isConnexionAvailableAdresseIP(adresseIP) async {
    try {
      final result = await InternetAddress.lookup(adresseIP);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return "true";
      }
      return "";
    } on SocketException catch (_) {
      return "";
    }
  }
}
