import 'package:flutter/material.dart';
import 'package:freeman_business/Dossier/ajouter_dossier.dart';
import 'package:freeman_business/accueil.dart';
import 'package:freeman_business/balance.dart';
import 'package:freeman_business/banque.dart';
import 'package:freeman_business/Dossier/dossier.dart';
import 'package:freeman_business/Importateur/importateur.dart';
import 'package:freeman_business/livre_de_caisse.dart';
import 'package:freeman_business/Operations/operation.dart';
import 'package:freeman_business/resultat.dart';
import 'package:freeman_business/try.dart';
import 'package:freeman_business/VoirEvolution/voir_evolution.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FreemanApp',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login' ,
      routes: {
        '/login':(context)=>Login(),
        '/accueil':(context)=>Accueil(),
        '/evolution': (context)=>VoirEvolution(),
        '/try':(context)=> MyHomePage(),
        '/importateur':(Context)=>Importateur(),
        '/operation' :(Context)=>Operation(),
        '/balance' : (Context)=>Balance(),
        '/banque' : (Context)=>Banque(),
        '/resultat' : (Context)=>Resultat(),
        '/livre_de_caisse' : (Context)=>Livre_de_caisse(),
        '/dossierencours' : (Context)=>DossierEncours(),
        '/dossiercloture' : (Context)=>DossierCloture(),
        '/ajouter_dossier' : (Context)=>AjouterDossier()

    },
    );
  }
}

