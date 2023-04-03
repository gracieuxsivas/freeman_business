import 'package:flutter/material.dart';

//import '../Models/dossier_PV_Model.dart';
import 'model_list_file.dart';



class DossierFacture_scr extends StatefulWidget {
  const DossierFacture_scr({Key? key}) : super(key: key);

  @override
  State<DossierFacture_scr> createState() => _DossierFacture_scrState();
}

class _DossierFacture_scrState extends State<DossierFacture_scr> {

  // List<ModelDossier_cloture> list_dossier_des_dossiers_cloture= [
  //   ModelDossier_cloture (designation: 'Designatio', charge: '    70', facture: 'Facture', resultat: 'Charge   '),
  //
  // ];
  // bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      //isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        title: Column(
          children: [
            Row(
              children: [
                Text('  design dossier ici  ',

                  style: TextStyle(fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,),

                ),



                const Spacer(),
                IconButton(onPressed: () {},
                    icon: Icon(Icons.playlist_add,
                        size: 35,
                        color: Colors.black)),

              ],
            ),
          ],
        ),


        elevation: 0,
        backgroundColor: Colors.blue,
        centerTitle: true,
        toolbarHeight: MediaQuery.of(context).size.height*0.09,


      ),
      //backgroundColor: Colors.grey[300],


      body:

      Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 2, 10, 0),
            height: MediaQuery.of(context).size.height*0.05,
            //height: 125,
            color: Colors.blue,

            child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Column(
                  //   children: [
                  //     Row(
                  //       children: [
                  //         IconButton(onPressed: () {},
                  //             icon: Icon(Icons.cancel,
                  //                 size: 30,
                  //                 color: Colors.black)),
                  //
                  //         const Spacer(),
                  //
                  //         //Designation pour la facturation
                  //         Text('  design dossier ici  ',
                  //           style: TextStyle(fontSize: 15,
                  //               color: Colors.white,
                  //               fontWeight: FontWeight.bold),
                  //         ),
                  //
                  //         const Spacer(),
                  //         IconButton(onPressed: () {},
                  //             icon: Icon(Icons.playlist_add,
                  //                 color: Colors.black)),
                  //       ],
                  //     )
                  //   ],
                  //
                  // ),

                  Row(children: [

                   // const Spacer(),

                  ]),

                  SizedBox(height: 12,),

                  Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Designa',
                          style: TextStyle(fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),),
                        const Spacer(),
                        Text('Compte',
                          style: TextStyle(fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),),
                        const Spacer(),
                        Text('Détails',
                          style: TextStyle(fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),),
                        const Spacer(),
                        Text('Montant',
                          style: TextStyle(fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),),
                      ]),
                ]),

          ),


          // Expanded(
          //     child: FutureBuilder<List<CompteModel>>(
          //         future: CompteModel.getBanqueGroupe(groupeCompteBanque),
          //         builder: (context, snapshot) {
          //
          //           //Chargement des donnees
          //           if (!snapshot.hasData) {
          //             return Center(
          //               child: Container(
          //                   margin: const EdgeInsets.all(20),
          //                   child:  const CircularProgressIndicator(
          //                     color: Colors.blue,
          //                   )),
          //             );
          //           }
          //           //Quand la methode renvoie les donnees
          //
          //           if (snapshot.data!.length == 0) {
          //
          //             //si la taille de la liste est 0, on affiche un message : aucune donnee disponible
          //             return Center(
          //               child: Container(
          //                 margin: const EdgeInsets.all(20),
          //                 child:  Column(
          //                   // mainAxisAlignment: MainAxisAlignment.center,
          //                   children: const [
          //                     Text(
          //                       "aucune donnée disponible",
          //                       textAlign: TextAlign.center,
          //                       style: TextStyle(
          //                           fontWeight: FontWeight.normal,
          //                           fontSize: 20,
          //                           fontStyle: FontStyle.italic),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             );
          //           }
          //           //affichage de la liste renvoi par la methode, au cas ou la liste contient des donnees
          //           return ListView.separated(
          //             padding: const EdgeInsets.only(
          //               left: 0,
          //               right: 0,
          //               top: 20,
          //               bottom: 100,
          //             ),
          //             itemCount: snapshot.data!.length,
          //             itemBuilder: (context, index) {
          //               CompteModel banqueObject = snapshot.data![index];
          //
          //               //iteration de la liste
          //               return ListTile(
          //                 title: Text(' ',
          //                   //importObject.designationGroupe.toString(),
          //                   style: TextStyle(fontSize: 11),),
          //                 subtitle: Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     Text(banqueObject.designationGroupe.toString()),
          //                     Text(banqueObject.numCompte.toString()),
          //                     Text(banqueObject.solde.toString()),
          //                   ],
          //                 ),
          //               );
          //             },
          //             separatorBuilder: (BuildContext context, int index) {
          //               return  Divider(
          //                 color: Colors.grey[600],
          //                 height: 1,
          //               );
          //             },
          //           );
          //         })
          // ),




        ],
      ),

    );
  }
}


