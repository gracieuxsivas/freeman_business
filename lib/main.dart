import 'package:flutter/material.dart';
//import 'package:freeman_business/Dossier/ajouter_sous_dossier.dart';
//import 'package:freeman_business/Dossier/nouveau_dossier.dart';
//import 'package:freeman_business/Importateur/nouveau_compte_Importateur.dart';
//import 'package:freeman_business/VoirEvolution/recherche_du_compte.dart';
import 'package:freeman_business/accueil.dart';
import 'package:freeman_business/SCREENS/Balance/balance_screen.dart';
import 'package:freeman_business/SCREENS/Banque/banque.dart';
//import 'package:freeman_business/Dossier/dossier_PV_screen.dart';
//import 'package:freeman_business/Importateur/importateur_screen.dart';
import 'package:freeman_business/SCREENS/Livre_de_caisse/livre_de_caisse.dart';
//import 'package:freeman_business/Operations/operation.dart';
import 'package:freeman_business/SCREENS/Resultat/resultat.dart';
import 'package:freeman_business/splashScreen.dart';
import 'package:freeman_business/try.dart';
//import 'package:freeman_business/VoirEvolution/voir_evolution.dart';
//import 'Dossier/dossier_cloture.dart';
//import 'Dossier/dossier_cloture_screen.dart';
import 'SCREENS/Importateur/nouveau_compte_Importateur.dart';
import 'SCREENS/Operations/operation.dart';
//import 'SCREENS/VoirEvolution/recherche_du_compte.dart';
//import 'SCREENS/VoirEvolution/voir_evolution.dart';
import 'VoirEvolution/recherche_du_compte.dart';
import 'VoirEvolution/voir_evolution.dart';
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
      initialRoute: '/splash' ,
      routes: {
        '/splash':(context)=>const SplashScreen(),
        '/login':(context)=>Login(),
        '/accueil':(context)=>Accueil(),
        '/evolution': (context)=>const VoirEvolution(),
       // '/try':(context)=> TryClass(numCompte: 411,),
       // '/importateur':(Context)=>Importateur(),
        '/operation' :(Context)=>Operation(),
       // '/balance' : (Context)=>Balance(),
       // '/banque' : (Context)=>Banque(),
      //  '/resultat' : (Context)=>Resultat(),
        //'/livre_de_caisse' : (Context)=>Livre_de_caisse(),
        //'/dossierencours' : (Context)=>DossierEncours(),
     //   '/dossiercloture' : (Context)=>DossierCloture(),
     //   '/ajouter_dossier' : (Context)=>AjouterDossier(),
        '/recherche_du_compte':(Context)=>RechercheDuCompte(),
      //  '/ajouter_dossier':(Context)=>AjouterDossier(),
      //  '/nouveau_importateur':(Context)=>NouveauImportateur(),
        '/nouveau_compte_mportateur':(Context)=>NouveauCompteImportateur(),


      },
    );
  }
}

