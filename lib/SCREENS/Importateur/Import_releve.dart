import 'package:flutter/material.dart';
import 'package:freeman_business/Models/importateur_Releve_model.dart';
import 'package:intl/intl.dart';
import 'package:freeman_business/Models/resultatModel.dart';

class ImportReleve extends StatefulWidget {
  //const Resultat({Key? key}) : super(key: key);
  int Compte;
  String NumOperation;
  //int numCompte;
 ImportReleve( String date_1, String date_2 ,   {required this.Compte, required this.NumOperation});

  @override
  State<ImportReleve> createState() => _ImportReleveState(Compte:Compte, NumOperation: '');
}

class _ImportReleveState extends State<ImportReleve> {
  int Compte=0;

  _ImportReleveState ({required this.Compte, required this.NumOperation, });


  //Variable for date Picker
  String _dateTime1=DateFormat('yyyy-MM-dd').format(DateTime.now().add(Duration(days: -30)));
  String _dateTime2=DateFormat('yyyy-MM-dd').format(DateTime.now());

   // DateTime _selecteddate1=DateTime.now();
   // DateTime  _selecteddate2=DateTime.now();


  // dateTime(contect) async {
  //   print("Selectionnez la date");
  // }

  String date_1 = "" ;
  String date_2= "";
  String NumOperation ="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    date_1 = _dateTime1 ;
    date_2 = _dateTime2;

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
       date_1=formattedDate.toString();
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
       date_2=formattedDate.toString();
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
        title: const Text("Relevé de ",
          style: TextStyle(
              fontSize:15,
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
                            Text('Du : $date_1 ', //$_selectedYear
                              style: TextStyle(fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),),

                            const Spacer(),


                            GestureDetector(
                              onTap: (){
                                _showDate(context);
                                //     _selectedYear(context);
                              },

                              child: const Icon(Icons.calendar_month, size: 40),

                            ),

                            Text('    Au : $date_2 ', //$_selectedYear
                              style: TextStyle(fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),),

                            const Spacer(),

                            GestureDetector(
                              onTap: (){

                                _showDate2(context);

                              },

                              child: const Icon(Icons.calendar_month, size: 40),

                            )


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
              child: FutureBuilder<List<ImportateurReleveModel>>(
               future: ImportateurReleveModel.getReleveImp(Compte, date_1, date_2),


                 // future: ImportateurReleveModel.getReleveImp(date_1),

                  //future: ResultatModel.getResultat(annee),
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
                        ImportateurReleveModel releveObject = snapshot.data![index];

                        //iteration de la liste
                        return InkWell(
                          onTap: (){
                            String NumOperation ="";
                            setState(() {
                              // showModalBottomSheet(
                              //     context: context,
                              //     isDismissible: false,
                              //     shape: RoundedRectangleBorder(
                              //       borderRadius: BorderRadius.only(
                              //         topRight: Radius.circular(20),
                              //         topLeft: Radius.circular(20),
                              //       ),
                              //     ),
                              //     builder: (context){
                              //       Navigator.push(context,
                              //           MaterialPageRoute(
                              //               builder: (context) =>ImportReleve(NumOperation: releveObject.numeroOperation.toString(), Compte: Compte,));
                              //
                              //
                              //   return Container(
                              //     padding: EdgeInsets.all(25),
                              //     child: Column(
                              //       children: [
                              //         Row(children: [
                              //           Text("Libellé",
                              //             style: TextStyle(fontSize: 15,
                              //                 color: Colors.black,
                              //                 fontWeight: FontWeight.bold)
                              //           ),
                              //             const Spacer(),
                              //             Text('Compte',
                              //               style: TextStyle(fontSize: 15,
                              //                   color: Colors.black,
                              //                   fontWeight: FontWeight.bold),),
                              //             const Spacer(),
                              //             Text('Débit',
                              //               style: TextStyle(fontSize: 15,
                              //                   color: Colors.black,
                              //                   fontWeight: FontWeight.bold),),
                              //             const Spacer(),
                              //             Text('Crédit',
                              //               style: TextStyle(fontSize: 15,
                              //                   color: Colors.black,
                              //                   fontWeight: FontWeight.bold),),
                              //         ],),
                              //
                              //         //DONNEES FROM APIS
                              //
                              //
                              //
                              //         Expanded(
                              //             child: FutureBuilder<List<ImportateurReleveModel>>(
                              //                 future: ImportateurReleveModel.getDetailReleveOperation(NumOperation),
                              //                 builder: (context, snapshot) {
                              //
                              //                   //Chargement des donnees
                              //                   if (!snapshot.hasData) {
                              //                     return Center(
                              //                       child: Container(
                              //                           margin: const EdgeInsets.all(20),
                              //                           child:  const CircularProgressIndicator(
                              //                             color: Colors.blue,
                              //                           )),
                              //                     );
                              //                   }
                              //                   //Quand la methode renvoie les donnees
                              //
                              //                   if (snapshot.data!.length == 0) {
                              //
                              //                     //si la taille de la liste est 0, on affiche un message : aucune donnee disponible
                              //                     return Center(
                              //                       child: Container(
                              //                         margin: const EdgeInsets.all(20),
                              //                         child:  Column(
                              //                           // mainAxisAlignment: MainAxisAlignment.center,
                              //                           children: const [
                              //                             Text(
                              //                               "aucune donnée disponible",
                              //                               textAlign: TextAlign.center,
                              //                               style: TextStyle(
                              //                                   fontWeight: FontWeight.normal,
                              //                                   fontSize: 20,
                              //                                   fontStyle: FontStyle.italic),
                              //                             ),
                              //                           ],
                              //                         ),
                              //                       ),
                              //                     );
                              //                   }
                              //                   //affichage de la liste renvoi par la methode, au cas ou la liste contient des donnees
                              //                   return ListView.separated(
                              //                     padding: const EdgeInsets.only(
                              //                       left: 0,
                              //                       right: 0,
                              //                       top: 20,
                              //                       bottom: 100,
                              //                     ),
                              //                     itemCount: snapshot.data!.length,
                              //                     itemBuilder: (context, index) {
                              //                       ImportateurReleveModel numOpObject = snapshot.data![index];
                              //
                              //                       //importObject.numCompte
                              //
                              //
                              //                       //iteration de la liste
                              //                       return ListTile(
                              //                         title: Text(' ',
                              //                           //importObject.designationGroupe.toString(),
                              //                           style: TextStyle(fontSize: 11),),
                              //                         subtitle: Row(
                              //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //                           children: [
                              //                             Text(numOpObject.detailFacture.toString()),
                              //                             Text(numOpObject.numCompte.toString()),
                              //                             Text(numOpObject.debit.toString()),
                              //                             Text(numOpObject.credit.toString()),
                              //                           ],
                              //                         ),
                              //                       );
                              //                     },
                              //                     separatorBuilder: (BuildContext context, int index) {
                              //                       return  Divider(
                              //                         color: Colors.grey[600],
                              //                         height: 1,
                              //                       );
                              //                     },
                              //                   );
                              //                 })
                              //         ),
                              //
                              //
                              //         //_________________
                              //
                              //
                              //         Container(
                              //
                              //           height: MediaQuery.of(context).size.height*0.30,
                              //
                              //           child: Row(
                              //             crossAxisAlignment: CrossAxisAlignment.end,
                              //             mainAxisAlignment: MainAxisAlignment.end,
                              //             children: [
                              //               TextButton(
                              //                   onPressed: (){
                              //                     Navigator.pop(context);
                              //                   },
                              //                   child: Text("QUITTER",
                              //                   style: TextStyle(
                              //                     fontSize: 14,
                              //                     fontWeight: FontWeight.bold
                              //                   ),)),
                              //
                              //               ElevatedButton(
                              //                   onPressed: (){
                              //
                              //                   },
                              //                   child: Text("SUPPRIMER",
                              //                     style: TextStyle(
                              //                         fontSize: 14,
                              //                         fontWeight: FontWeight.bold
                              //                     ),
                              //                   )),
                              //
                              //             ],
                              //           ),
                              //         )
                              //       ],
                              //     ),
                              //     height: MediaQuery.of(context).size.height*0.40,
                              //   );
                              //     });



                            });
                          },


                          child: ListTile(
                            title: Text(' ',
                              //importObject.designationGroupe.toString(),
                              style: TextStyle(fontSize: 11),),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(releveObject.dateOperation.toString()),
                                Text(releveObject.numeroOperation.toString()),
                                Text(releveObject.details.toString()),
                                Text(releveObject.debit.toString()),
                                Text(releveObject.credit.toString()),
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
                  child: Text(" Debit",
                    style: TextStyle(fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),


                Container(
                  child: Text(" Credit",
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
                  child: Text(" Debit",
                    style: TextStyle(fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),


                Container(
                  child: Text(" Credit",
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
