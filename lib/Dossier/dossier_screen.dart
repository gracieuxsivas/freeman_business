import 'package:flutter/material.dart';

import '../Models/dossier.dart';
import '../Models/dossier.dart';
import 'model_list_file.dart';

class DossierEncours extends StatefulWidget {
   int etat;
  //const DossierEncours({Key? key, required this.etat}) : super(key: key);
  DossierEncours({ required this.etat});

  @override
  State<DossierEncours> createState() => _DossierEncoursState(etat:etat);
}

class _DossierEncoursState extends State<DossierEncours> {
  int etat=0;
  _DossierEncoursState({required this.etat});

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

                 Text(etat==0? 'DOSSIER EN COURS':'DOSSIER CLOTURE',
                  style: TextStyle(fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),

                const Spacer(),
                    etat==0?IconButton(onPressed: () {
                  Navigator.pushNamed(context, '/ajouter_dossier');
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
                        Text('Designation/Charge',
                          style: TextStyle(fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),),
                        const Spacer(),
                        Text('Facture',
                          style: TextStyle(fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),),
                        const Spacer(),
                        Text('Resultat',
                          style: TextStyle(fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),),
                      ]),

                ]),



          ),

          Expanded(
              child: FutureBuilder<List<Dossier>>(
                  future: Dossier.getDossier(etat),
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
                      //ci la taille de la liste est 0, on affiche un message : aucune donnee disponible
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
                        return ListTile(
                          title: Text(dossierObject.detailPV.toString(),style: TextStyle(fontSize: 11),),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                                Text(dossierObject.charge.toString()),
                                Text(dossierObject.facturation.toString()),
                                Text(dossierObject.resultat.toString()),
                            ],
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


