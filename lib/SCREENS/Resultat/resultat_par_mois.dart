import 'package:flutter/material.dart';
import 'package:freeman_business/Models/compteModel.dart';
import 'package:freeman_business/SCREENS/Importateur/Import_releve.dart';
import 'package:freeman_business/SCREENS/Resultat/resultat_par_mois_releve.dart';

import '../../Models/resultatModel.dart';
import 'package:freeman_business/SCREENS/Resultat//resultat.dart';


class ResultatParMois extends StatefulWidget {
  //const Importateur({Key? key}) : super(key: key);
  int annee;
  String mois;

  ResultatParMois(    { required this.annee, required this.mois,});

  @override
  State<ResultatParMois> createState() => _ResultatParMoisState(annee:annee, mois: mois);
}

class _ResultatParMoisState extends State<ResultatParMois> {

  _ResultatParMoisState({required this.annee, required this.mois,});

  int annee=0;
  String mois ="";
  DateTime monthyear = DateTime(DateTime.monthsPerYear);

  String date_1="";
  String date_2="";

  String get numCompte => "";
  //int numCompte=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    //final double height= MediaQuery.of(context).size.height;
    //final double width= MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[300],

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        centerTitle: true,
        toolbarHeight: MediaQuery.of(context).size.height*0.06,
        title:
        Column(
            children: [
              Row(children: [
                //Icon(Icons.arrow_back),
               //Text('${monthyear.month}',
                  Text(mois,

                  style: TextStyle(fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
              ]),

            ]),
      ),

      body:
      Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 2, 10, 0),
            height: 40,
            color: Colors.blue,

            child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  Row(children: [

                  ]),

                  SizedBox(height: 12,),

                  Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Référence',
                          style: TextStyle(fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),),
                        const Spacer(),
                        Text('Charge',
                          style: TextStyle(fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),),
                        const Spacer(),
                        Text('Produit',
                          style: TextStyle(fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),),
                      ]),

                  // TextFormField(),
                ]
            ),

          ),


//AFFICHAGE DES DONNEES FROM API

          Expanded(
              child: FutureBuilder<List<ResultatModel>>(
                  future: ResultatModel.getResultatParMois(mois, annee),
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
                        ResultatModel resultatParMoisObject = snapshot.data![index];

                        //importObject.numCompte


                        //iteration de la liste
                        return InkWell(
                          onTap: (){
                            setState(() {

                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context) =>ResultatParMoisReleve(
                                          Compte: resultatParMoisObject.numCompte,
                                          mois: resultatParMoisObject.periode.toString(),
                                          annee: annee,
                                          NomCompte: resultatParMoisObject.designationCompte.toString(),
                                          date_1, date_2,
                                      ))
                              );

                            });
                          },
                          child: ListTile(
                            title: Text(' ',
                              //resultatParMoisObject.charge.toString(),
                              style: TextStyle(fontSize: 11),),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(resultatParMoisObject.numCompte.toString()),
                                Text(resultatParMoisObject.designationCompte.toString()),
                                Text(resultatParMoisObject.charge.toString()),
                                Text(resultatParMoisObject.produit.toString()),
                              ],
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
