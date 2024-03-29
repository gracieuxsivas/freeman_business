import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
//import 'package:freeman_business/Importateur/importateur_screen.dart';
import 'package:freeman_business/Models/groupeCompte.dart';
import 'package:freeman_business/Models/users.dart';
import 'package:freeman_business/SCREENS/Resultat/resultat.dart';

//import 'Dossier/dossier_PV_screen.dart';
import 'Models/dossiersPrinc_model.dart';
import 'SCREENS/Dossier/DossierPrincipal.dart';
import 'SCREENS/Dossier/dossier_PV_screen.dart';
import 'SCREENS/Importateur/importateur_screen.dart';
import 'SCREENS/Balance/balance_screen.dart';
import 'SCREENS/Banque/banque.dart';
import 'SCREENS/Livre_de_caisse/livre_de_caisse.dart';

class Accueil extends StatefulWidget {
  const Accueil({Key? key}) : super(key: key);


  @override
  State<Accueil> createState() => _AccueilState();

}

class _AccueilState extends State<Accueil> {


  //var items =  ['Dossiers en cours', 'Dossier cloturés'];
  String nomUtilisateur = "",service = "";
  double soldeCaisse =0,soldeBanque =0,soldeImporateur =0,soldeFournisseur = 0;
  bool isLoading =false;
  int etat_dossier=0;


  int import =411; //<GROUPE COMPTE IMPORTATEUR
  int bal = 0;
  int groupeCompteBanque=521;
  int groupeLivreDeCaisse=571;
  int resultatParAn=0;
  int numCompte=0;
  late final Dossier dossier;


  //int BalanceCompte =0;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Users.getCurrentUsers().then((value) async{
      Users comptes = value;
      setState(() {
        nomUtilisateur = comptes.designationUt!;
        service = comptes.serviceAffe!;
      });

    });

    setState(() {
      isLoading =  true;
    });
    GroupeCompte.getSoldeGroupeCompte(GroupeCompte.Banque).then((value) => setState(() {
      soldeBanque = value;
      isLoading =  false;
    }));
  }





  @override
  Widget build(BuildContext context) {
    //final double height= MediaQuery.of(context).size.height;
    //final double width= MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("FREEMAN BUSINESS",style: TextStyle(

        ),),
      ),
     backgroundColor: Colors.grey[300],
      body: 
      Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.person),
                ),
                title: Text(nomUtilisateur,style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  fontSize: 16
                ),),
                subtitle: Text(service,style: const TextStyle(
                    fontWeight: FontWeight.bold
                ),),
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0,bottom: 20),
                  child: Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Card(
                            margin: EdgeInsets.all(5),
                            child: Container(
                              color: Colors.white,
                             padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(5),

                              height: MediaQuery.of(context).size.height*0.20,
                              width: MediaQuery.of(context).size.width*0.33,

                              child:
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      radius: 40,
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        icon: Icon(Icons.home,size: 50,),
                                        color: Colors.white,
                                        onPressed: () {
                                          Navigator.pushNamed(context, '/evolution');
                                        },
                                      ),
                                    ),

                                    Text("Accueil",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                    ),
                                    //SizedBox(height: 5,),
                                    Divider(height: 12, color: Colors.grey[90],),
                                    //SizedBox(height: 5,),
                                    Text("Voir l'evolution",
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                        textAlign: TextAlign.center
                                    ),

                                  ],
                                )
                            ),
                          ),

                    //_______2EME CARD_ CONTENANT FOCUSEDMENUHOLDER____ BTN DOSSIER_________________________

                      Row(
                        children: [
                          FocusedMenuHolder(
                              menuWidth: MediaQuery.of(context).size.width*0.5,//<= prendre la moitier de la largeur ecran
                              openWithTap: true,
                              blurSize: 4,
                              //borderRadius:BorderRadius.circular(20),
                              onPressed: (){},
                              menuItems: <FocusedMenuItem> [
                              FocusedMenuItem(title: Text("Dosser en cours"),
                                  onPressed: () {
                                  etat_dossier = 1;

                           //ENVOIE DES DATAS TO ANOTHER PAGE
                                  Navigator.push(context,
                                        MaterialPageRoute(builder:
                                        (context) => DossierPrinc(etat: etat_dossier
                                          //dossier: dossier,
                                          //designation: '',
                                        )));
                                  },
                                  backgroundColor: Colors.orange[200]),

                              FocusedMenuItem(title: Text("Dosser cloturé"),
                                  onPressed: () {
                                  etat_dossier = 0;
                                  //Navigator.pushNamed(context, '/dossiercloture');
                                    Navigator.push(context,
                                        MaterialPageRoute(
                                            builder: (context) =>DossierPrinc(etat: etat_dossier
                                              //dossier: dossier,
                                              //designation: '',
                                            ))
                                    );
                              }),
                            ],
                              child:
                                    Card(
                                      margin: EdgeInsets.all(5),
                                      child: Container(
                                        color: Colors.white,
                                        padding: EdgeInsets.all(2),
                                        margin: EdgeInsets.all(5),
                                        height: MediaQuery.of(context).size.height*0.20,
                                        width: MediaQuery.of(context).size.width*0.33,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,

                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.orange,
                                            radius: 40,

                                            child: Icon(

                                              Icons.folder,size: 50,
                                              color: Colors.white,

                                            ),
                                          ),

                                          Text("Dossier",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ), textAlign: TextAlign.center,),
                                          //SizedBox(height: 5,),
                                          Divider(height: 12, color: Colors.grey[90],),
                                          //SizedBox(height: 5,),
                                          Text("Les dossiers de déclaration",
                                              style: TextStyle(
                                                fontSize: 10,
                                              ),
                                              textAlign: TextAlign.center
                                          ),
                                        ],
                                      ),
                                    ), )
                              ),
                        ],
                      ),
                        ],
                      ),

                      //______________________________________
//->/DEUXIEME ROW_______________________________________________
                      //______________________________________

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Card(

                            margin: EdgeInsets.all(5),
                            child: Container(
                                color: Colors.white,
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.all(5),
                                height: MediaQuery.of(context).size.height*0.20,
                                width: MediaQuery.of(context).size.width*0.33,

                                child:
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.green,
                                      radius: 40,
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        icon: Icon(Icons.group,size: 50,),
                                        color: Colors.white,
                                        onPressed: () {
                                          //Navigator.pushNamed(context, '/importateur');

                                          Navigator.push(context,
                                              MaterialPageRoute(
                                              builder: (context) =>Importateur(import: import))
                                          );
                                        },
                                      ),
                                    ),

                                    Text("Importateur",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),),
                                    //SizedBox(height: 5,),
                                    Divider(height: 12, color: Colors.grey[90],),
                                    //SizedBox(height: 5,),
                                    Text("Voir les importateurs",
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                        textAlign: TextAlign.center
                                    ),

                                  ],
                                )
                            ),
                          ),

                          //______________________________________________

                          Card(

                            margin: EdgeInsets.all(5),
                            child: Container(
                                color: Colors.white,
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.all(5),
                                height: MediaQuery.of(context).size.height*0.20,
                                width: MediaQuery.of(context).size.width*0.33,

                                child:
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      radius: 40,
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        icon: Icon(Icons.work,size: 50,),
                                        color: Colors.white,
                                        onPressed: () {
                                          Navigator.pushNamed(context, '/operation');
                                        },
                                      ),
                                    ),

                                    Text("Opération",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),),
                                    //SizedBox(height: 5,),
                                    Divider(height: 12, color: Colors.grey[90],),
                                    //SizedBox(height: 5,),

                                    Text("Effectuer operation",
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                        textAlign: TextAlign.center
                                    ),

                                  ],
                                )

                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Card(

                            margin: EdgeInsets.all(5),
                            child: Container(
                                color: Colors.white,
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.all(5),

                                height: MediaQuery.of(context).size.height*0.20,
                                width: MediaQuery.of(context).size.width*0.33,

                                child:
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.grey[700],
                                      radius: 40,
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        icon: Icon(Icons.balance,size: 50,),
                                        color: Colors.white,
                                        onPressed: () {
                                        //  Navigator.pushNamed(context, '/balance');

                                          Navigator.push(context,
                                              // MaterialPageRoute(
                                              //     builder: (context) =>Balance())

                                              MaterialPageRoute(
                                              builder: (context) =>Balance())

                                          );
                                        },
                                      ),
                                    ),

                                    Text("Balance",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),),
                                    //SizedBox(height: 5,),
                                    Divider(height: 12, color: Colors.grey[90],),
                                    //SizedBox(height: 5,),
                                    Text("Balance de compte",
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                        textAlign: TextAlign.center
                                    ),

                                  ],
                                )
                            ),
                          ),

                          //______________________________________________

                          Card(

                            margin: EdgeInsets.all(5),
                            child: Container(
                                color: Colors.white,
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.all(5),

                                height: MediaQuery.of(context).size.height*0.20,
                                width: MediaQuery.of(context).size.width*0.33,

                                child:
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    CircleAvatar(
                                      backgroundColor: Colors.pink[800],
                                      radius: 40,
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        icon: Icon(Icons.temple_hindu,size: 50,),
                                        color: Colors.white,
                                        onPressed: () {
                                         // Navigator.pushNamed(context, '/banque');

                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) =>Banque(groupeCompteBanque: groupeCompteBanque))
                                            //compte==411
                                          );
                                        },
                                      ),
                                    ),

                                    Text("Banque",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),),
                                    //SizedBox(height: 5,),
                                    Divider(height: 12, color: Colors.grey[90],),
                                    //SizedBox(height: 5,),
                                    Text("Voir la banque",
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                        textAlign: TextAlign.center
                                    ),

                                  ],
                                )

                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Card(

                            margin: EdgeInsets.all(5),
                            child: Container(
                                color: Colors.white,
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.all(5),

                                height: MediaQuery.of(context).size.height*0.20,
                                width: MediaQuery.of(context).size.width*0.33,

                                child:
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.blue[900],
                                      radius: 40,
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        icon: Icon(Icons.streetview,size: 50,),
                                        color: Colors.white,
                                        onPressed: () {
                                          //Navigator.pushNamed(context, '/resultat');
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) =>Resultat(resultatParAn: resultatParAn))
                                          );
                                        },
                                      ),
                                    ),

                                    Text("Resultat",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),),
                                    //SizedBox(height: 5,),
                                    Divider(height: 12, color: Colors.grey[90],),
                                    //SizedBox(height: 5,),
                                    Text("Resultat par mois",
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                        textAlign: TextAlign.center),

                                  ],
                                )
                            ),
                          ),

                          //______________________________________________

                          Card(

                            margin: EdgeInsets.all(5),
                            child: Container(
                                color: Colors.white,
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.all(5),

                                height: MediaQuery.of(context).size.height*0.20,
                                width: MediaQuery.of(context).size.width*0.33,

                                child:
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    CircleAvatar(
                                      backgroundColor: Colors.orange,
                                      radius: 40,
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        icon: Icon(Icons.library_books,size: 50,),
                                        color: Colors.white,
                                        onPressed: () {
                                          //Navigator.pushNamed(context, '/livre_de_caisse');
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) =>Livre_de_caisse(groupeLivreDeCaisse: groupeLivreDeCaisse,))

                                          );



                                        },
                                      ),
                                    ),

                                    Text("Livre de caisse",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),),
//SizedBox(height: 5,),
                                    Divider(height: 12, color: Colors.grey[90],),
//SizedBox(height: 5,),
                                    Text("Voir le livre de caisse",
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                        textAlign: TextAlign.center
                                    ),

                                  ],
                                )
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )


    );
  }
}
