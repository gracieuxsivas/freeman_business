import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:freeman_business/SCREENS/Dossier/dossier_PV_screen.dart';

//import '../Models/dossier_PV_Model.dart';
//import '../Models/dossier_PV_Model.dart';
import '../../Models/dossier_PV_Model.dart';
import '../../Models/dossiersPrinc_model.dart';
import 'Modifier_dossier.dart';
import 'dossier_facturation_screen.dart';
import 'model_list_file.dart';
import 'nouveau_dossier.dart';

class DossierPrinc extends StatefulWidget {
  int etat;

  Dossier dossier = Dossier(idDossier: 0,numDossier: '', designationDossier: '', etat: false);
  //const DossierEncours({Key? key, required this.etat}) : super(key: key);
  DossierPrinc({ required this.etat,

    //required this.dossier
  });

  @override
  State<DossierPrinc> createState() => _DossierPrincState(etat:etat,
      //designation:designation,
      //dossier:dossier
  );
}

class _DossierPrincState extends State<DossierPrinc> {
  int etat=0;
  String designation= "";


  Dossier dossier = Dossier(idDossier: 0,numDossier: '', designationDossier: '', etat: false);

  _DossierPrincState({required this.etat,
   // required this.designation,
    //required this.dossier
  });

  //String numDossier="";
  //get numDossier => numDossier;
  String text="";
  bool isLoading = false;


  //

  @override
  Widget build(BuildContext context) {
    //final double height= MediaQuery.of(context).size.height;
    //final double width= MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: MediaQuery.of(context).size.height*0.06,
        title:
        Column(
            crossAxisAlignment: CrossAxisAlignment.end,

            children: [
              Row(
                  children: [

                    Text(etat==0? 'DOSSIER CLOTURE':'DOSSIER EN COURS ',
                      style: TextStyle(fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),

                    const Spacer(),
                    etat==1?IconButton(
                        onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) =>NouveauDossier())
                      );

                     // Navigator.pushNamed(context, '/ajouter_dossier');
                    },
                        icon: Icon(Icons.add,
                            color: Colors.white)):Container(),
                  ]),

              // SizedBox(height: 10,),

            ]),
      ),

      //backgroundColor: Colors.grey[300],

      body:
      Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 4, 10, 0),
            height: MediaQuery.of(context).size.height*0.06,
            color: Colors.blue,


            child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 12,),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [

                        Text('Code',
                          style: TextStyle(fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),),
                        const Spacer(),
                        Text('Designation',
                          style: TextStyle(fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),),
                        const Spacer(),
                        Text('',
                          style: TextStyle(fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),),
                      ]),

                ]),

          ),

          Expanded(
              child: FutureBuilder<List<Dossier>>(
                  future: Dossier.getDossiers(etat),
                  builder: (context, snapshot) {

                    //Chargement des donnees
                    if (!snapshot.hasData) {
                      return Center(
                        child: Container(
                            margin: const EdgeInsets.all(20),
                            child:  const CircularProgressIndicator(
                              color: Colors.blue,
                            )),
                      );
                    }
                    //quand la methode renvoie les donnees

                    if (snapshot.data!.length == 0) {
                      //Si la taille de la liste est 0, on affiche un message : aucune donnee disponible
                      return Center(
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          child:  Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "aucune donnée disponible",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20,
                                    fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    //affichage de la liste renvoi par la methode, au cas ou la liste contient des donnees
                    return ListView.separated(
                      padding: const EdgeInsets.only(
                        left: 0,
                        right: 0,
                        top: 20,
                        bottom: 100,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        Dossier dossierObject = snapshot.data![index];
                        //iteration de la liste

                        return InkWell(
                          onTap: (){
                            setState(() {
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context) =>DossierPV(
                                          dossier: dossierObject,
                                          // designationDossier:dossierObject.designationDossier.toString()
                                          //Compte: importObject.numCompte!.toInt(), date_1, date_2, NumOperation: '',
                                          //NomCompte: importObject.designationCompte.toString()
                                      ))
                              );
                            });
                          },
                          child: GestureDetector(
                            onLongPress: (){

                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => ModifierDossier(dossier:dossierObject ) )
                              );
                            },
                            child: ListTile(
                              title: Text(" "),
                              subtitle: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(dossierObject.numDossier.toString(), ),
                                  Text(dossierObject.designationDossier.toString()),
                                  Text(" "),
                                ],

                              ),


                              //DONNEES ENREGISTREES

                              trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                                children: [

                      //DIALOG POUR CLOTURER >>>>>>>>>>>>>>>>>>>>>>>

                                  IconButton(onPressed: (){

                                    Widget okButton = TextButton(
                                      child: Text("OK"),
                                      onPressed: () {

                                        // Dossier dossier = Dossier(idDossier: 0,numDossier: "4434",designationDossier:
                                        // dossierObject.designationDossier.toString(),etat: true);
                                        // setState(() {
                                        //isLoading = true;
                                        // });
                                        dossier.etat=false;
                                        Dossier.CloturerDossier(dossier).then((value){
                                          setState(() {
                                            isLoading = false;
                                          });

                                          //REPONSE SERVEUR:>>
                                          if(value == "200"){
                                            //enregistrement reussie avec success
                                            Navigator.of(context).pop();
                                          }else{
                                            //echec d'eregistrement
                                          }
                                        });

                                      },
                                    );
                                    AlertDialog
                                    alert = AlertDialog(
                                      title: Text("Cloturer"),
                                      content: Text("Voulez-vous cloturer ce dossier $designation", ),
                                      actions: [
                                        okButton,
                                      ],
                                    );

                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return alert;
                                      }

                                    );

                                  },
                                      icon: Icon(Icons.add_box))
                                ],
                              ),


                            ),

                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return  Divider(
                          color: Colors.grey[600],
                          height: 1,
                        );
                      },
                    );
                  })
          ),
        ],
      ),
    );
  }
}




//CLASS DOSSIER CLOTURE__________________________________________________________________________________________

// class DossierCloture extends StatefulWidget {
//   const DossierCloture({Key? key}) : super(key: key);
//
//   @override
//   State<DossierCloture> createState() => _DossierClotureState();
// }
//
// class _DossierClotureState extends State<DossierCloture> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.blue,
//         centerTitle: true,
//         toolbarHeight: MediaQuery.of(context).size.height*0.06,
//         title:
//         Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//
//             children: [
//               Row(
//                   children: [
//
//                     Text('DOSSIER CLOTURE',
//                       style: TextStyle(fontSize: 15,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold),
//                     ),
//
//                     const Spacer(),
//                     // IconButton(onPressed: () {},
//                     //     icon: Icon(Icons.add,
//                     //         color: Colors.white)),
//                   ]),
//
//               // SizedBox(height: 10,),
//
//             ]),
//       ),
//       //backgroundColor: Colors.grey[300],
//
//
//       body:
//       Container(
//         padding: EdgeInsets.fromLTRB(10, 2, 10, 0),
//         height: MediaQuery.of(context).size.height*0.05,
//
//         //height: 125,
//         color: Colors.blue,
//
//         child: Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//
//               Row(children: [
//
//                 const Spacer(),
//                 // IconButton(onPressed: () {},
//                 //     icon: Icon(Icons.add,
//                 //         color: Colors.white)
//                 // ),
//                 //Icon(Icons.search),
//
//               ]),
//
//               SizedBox(height: 12,),
//
//               Row(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Text('Designa',
//                       style: TextStyle(fontSize: 15,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold),),
//                     const Spacer(),
//                     Text('Charge',
//                       style: TextStyle(fontSize: 15,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold),),
//                     const Spacer(),
//                     Text('Facture',
//                       style: TextStyle(fontSize: 15,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold),),
//                     const Spacer(),
//                     Text('Resultat',
//                       style: TextStyle(fontSize: 15,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold),),
//                   ]),
//             ]),
//       ),
//     );
//   }
// }


