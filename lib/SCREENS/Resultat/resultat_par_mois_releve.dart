import 'package:flutter/material.dart';
import 'package:freeman_business/Models/importateur_Releve_model.dart';
import 'package:freeman_business/SCREENS/Importateur/DetailOperationReleve.dart';
import 'package:intl/intl.dart';
import 'package:freeman_business/Models/resultatModel.dart';

import '../../Models/Resultat_Releve_Model.dart';
import '../../Models/compteModel.dart';

class ResultatParMoisReleve extends StatefulWidget {
  //const Resultat({Key? key}) : super(key: key);
  String? Compte;
  String mois;
  int annee;
  String NomCompte;

  //int numCompte;
  ResultatParMoisReleve( String date_1, String date_2 ,{required this.Compte, required this.mois, required this.annee, required this.NomCompte});

  @override
  State<ResultatParMoisReleve> createState() => _ResultatParMoisReleveState(Compte:Compte, mois: mois, annee:annee, NomCompte:NomCompte);
}

class _ResultatParMoisReleveState extends State<ResultatParMoisReleve> {
  String? Compte="";
  String mois="";
  int annee=0;
  String NomCompte="";

    _ResultatParMoisReleveState ({required this.Compte, required this.mois, required this.annee, required this.NomCompte });


  //Variable for date Picker
  String _dateTime1=DateFormat('yyyy-MM-dd').format(DateTime.now().add(Duration(days: -30)));
  String _dateTime2=DateFormat('yyyy-MM-dd').format(DateTime.now());


  // int Compte=0;
  // String mois="";
  // int annee=0;

  String NumOperation ="";
  String NumOp="";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {

    });

  }

//Methode pour Afficher dATE

  //@override


  //_______________________________________________
  Future<void> _showDate(BuildContext) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015,),
      lastDate: DateTime(2101),
    );

    if (picked != null

    //&& picked != date_1
    ) {
      String formattedDate=DateFormat("yyy-MM-dd").format(picked);
      setState(() {
       // date_1=formattedDate.toString();
        // date_2=formattedDate.toString();
      });
      //date_1 = picked.toString();
    }
  }


  Future<void> _showDate2(BuildContext) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015,),
      lastDate: DateTime(2101),
    );

    if (picked != null

    //&& picked != date_1
    ) {
      String formattedDate=DateFormat("yyy-MM-dd").format(picked);
      setState(() {
        //date_2=formattedDate.toString();
        // date_2=formattedDate.toString();
      });
      //date_1 = picked.toString();
    }
  }
//_________________________________________________



  @override
  Widget build(BuildContext context) {
    //final double height= MediaQuery.of(context).size.height;
    //final double width= MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Relevé de $NomCompte',
          style: TextStyle(
              fontSize:18,
              color: Colors.white,
              fontWeight: FontWeight.bold  ) ,),

        centerTitle: true,


      ),

      backgroundColor: Colors.grey[300],

      body:

      Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 7, 10, 0),
            //height: 100,

            //height: MediaQuery.of(context).size.height*0.17,
            //width: MediaQuery.of(context).size.width*0.33,
            color: Colors.white,

            child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [


                  SizedBox(height: 5,),

                  Card(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      //margin: EdgeInsets.all(0),
                      color: Colors.white,

                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          //mainAxisAlignment: MainAxisAlignment.end,


                          //Display Date

                          children: [
                            Text('Mois : $mois/$annee ', //$_selectedYear
                              style: TextStyle(fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),),

                            const Spacer(),

                            GestureDetector(
                              onTap: (){
                               // _selectedYear(context);
                              },

                              child: const Icon(Icons.calendar_month, size: 40),

                            )

                            // IconButton(onPressed: _selectedYear,
                            //     icon: Icon(Icons.calendar_month, size: 40,) )

                          ]
                      ),
                    ),
                  ),

                  SizedBox(height: 12,),

                  Row(

                    //crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:const [
                        Text('Date',
                          style: TextStyle(fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),),
                        const Spacer(),
                        Text('Réf.',
                          style: TextStyle(fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),),
                        const Spacer(),
                        Text('Libellé',
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


                      ]),



                  SizedBox(height: 19,),


                  Row(
                    children: [
                      Container(
                        child: (
                            Text('Solde initial:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),)
                        ),
                      ),


                      const Spacer(),

                      Container(
                        child: (
                            Text(':',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),)
                        ),
                      ),


                    ],
                  )

                  // TextFormField(),
                ]),

          ),


          //DONNEES FROM API HERE


          Expanded(
              child: FutureBuilder<List<ResultatReleveModel>>(
                  future: ResultatReleveModel.getResultatParMoisReleve(Compte, mois, annee),


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
                        ResultatReleveModel releve_resultatObject = snapshot.data![index];

                        //iteration de la liste
                        return InkWell(
                          // onTap: (){
                          //   //String NumOp ="";
                          //   Navigator.push(context,
                          //       MaterialPageRoute(
                          //           builder: (context) =>DetailReleve(NumOp: releve_resultatObject.numeroOperation.toString()))
                          //
                          //
                          //   );
                          // },

                          child: ListTile(
                            title: Text(' ',
                              //importObject.designationGroupe.toString(),
                              style: TextStyle(fontSize: 11),),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(releve_resultatObject.dateOperation.toString()),
                                Text(releve_resultatObject.numeroOperation.toString()),
                                Text(releve_resultatObject.details.toString()),
                                Text(releve_resultatObject.debit.toString()),
                                Text(releve_resultatObject.credit.toString()),
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


      bottomNavigationBar: Container(
        //height: 40,
        height: MediaQuery.of(context).size.height*0.15,
        //width: MediaQuery.of(context).size.width*0.33,


        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(0),

          ),
        ),
        child:

        Column(
          //crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Text("Total  :",
                    style: TextStyle(fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                SizedBox(height: 10,),

                Container(
                  child: Text("......",
                    style: TextStyle(fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),


                Container(
                  child: Text(" ......",
                    style: TextStyle(fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),


              ],

            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Text("Solde  :",
                    style: TextStyle(fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                SizedBox(height: 10,),

                Container(
                  child: Text(" ...",
                    style: TextStyle(fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                Container(
                  child: Text("......",
                    style: TextStyle(fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
