
import 'package:flutter/material.dart';
import 'package:freeman_business/Models/resultatModel.dart';
import 'package:freeman_business/SCREENS/Resultat/resultat_par_mois.dart';

import '../../Models/importateur_Releve_Operations.dart';
import '../../Models/importateur_Releve_model.dart';

class DetailReleve extends StatefulWidget {
 // const DetailReleve({Key? key}) : super(key: key);
  //int Compte;
  String NumOp;
  //int numCompte;

  DetailReleve(    {/**required this.Compte,*/ required this.NumOp});

  @override
  State<DetailReleve> createState() => _DetailReleveState(/**Compte:Compte,*/ NumOp: NumOp);
}

class _DetailReleveState extends State<DetailReleve> {

  _DetailReleveState ({/**required this.Compte,*/ required this.NumOp, });

  //int Compte=0;
  String NumOp;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        appBar: AppBar(
          elevation: 1,
        ),

      //backgroundColor: Colors.grey[300],

       body: Column(
        children: [
          Container(
            color: Colors.blue,

            padding: EdgeInsets.all(20),

            child:  Column(
              children: [

                Row(children: [
                  Text("Libellé",
                      style: TextStyle(fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)
                  ),
                  const Spacer(),
                  Text('Compte',
                    style: TextStyle(fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),),
                  const Spacer(),
                  Text('Débit',
                    style: TextStyle(fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),),
                  const Spacer(),
                  Text('Crédit',
                    style: TextStyle(fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),),
                ],),
              ],
            ),
           // height: MediaQuery.of(context).size.height*0.40,
          ),

          //from api
          Expanded(
              child: FutureBuilder<List<ImportateurReleveModel>>(
                  future: ImportateurReleveModel.getDetailReleveOperation(NumOp),
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
                    //Quand la methode renvoie les donnees

                    if (snapshot.data!.length == 0) {

                      //si la taille de la liste est 0, on affiche un message : aucune donnee disponible
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
                        ImportateurReleveModel numOpsObject = snapshot.data![index];

                        return ListTile(
                          title: Text(' ',
                            //importObject.designationGroupe.toString(),
                            style: TextStyle(fontSize: 11),),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(numOpsObject.designationCompte.toString()),
                              Text(numOpsObject.numCompte.toString()),
                              Text(numOpsObject.debit.toString()),
                              Text(numOpsObject.credit.toString()),
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

          Container(

            height: MediaQuery.of(context).size.height*0.30,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text("QUITTER",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                      ),)),

                ElevatedButton(
                    onPressed: (){

                    },
                    child: Text("SUPPRIMER",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                      ),
                    )),
              ],
            ),
          )
        ]
      ),
    );
  }
}

