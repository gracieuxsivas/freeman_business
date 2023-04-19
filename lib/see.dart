import 'package:flutter/material.dart';
import 'package:freeman_business/Models/importateur_Releve_model.dart';
import 'package:freeman_business/Models/resultatModel.dart';
import 'package:intl/intl.dart';

import 'Models/importateur_Releve_model.dart';

class ImportRelev extends StatefulWidget {
  //const Resultat({Key? key}) : super(key: key);
  int Compte;
  //int numCompte;

  ImportRelev({required this.Compte});

  @override
  State<ImportRelev> createState() => _ImportRelevState(Compte: Compte);
}

class _ImportRelevState extends State<ImportRelev> {

  _ImportRelevState({required this.Compte});
 // String Compte=0 as String;
  int Compte = 0;


  //____________________________



  //VARIABLE POUR DATE TIME
  String _dateTime=DateFormat('yyyy-MM-dd').format(DateTime.now());
 // DateTime selectedDate = DateTime.now();
  DateTime selecteddate1=(DateTime.now().month -1) as DateTime;
  DateTime selecteddate2=DateTime.now();
//METHODE POUR SHOW DATE PICKER
  selectedYear(contect) async {
    print("Selecting date");
  }
  String date_1 ="";
  String date_2= "";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // annee =  _selecteddate as int;
    date_1 = selecteddate1.toString() ;
    date_2 = selecteddate2.toString() ;

    setState(() {


    });

    // ImportateurReleveModel.getReveveImp(Compte).then((value) => setState((){
    //   numCompte = value as int;
    //
    // }));

  }

  // void _selectedYear(BuildContext context){

    // showDialog(
    //   context: context,

        Future<void> _selectedDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101));
      if (picked != null && picked != selecteddate1) {
        setState(() {
          selecteddate1 = picked;
        });
      }
    }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

      // builder: (BuildContext context) {
      //   return AlertDialog(
      //     title: Text("Date"),
      //     content: Container( // Need to use container to add size constraint.
      //       width: 300,
      //       height: 300,
      //       child: YearPicker(
      //         initialDate: DateTime.now(),
      //         firstDate: DateTime(2000),
      //         lastDate: DateTime(2090),
      //         // save the selected date to _selectedDate DateTime variable.
      //         // It's used to set the previous selected date when
      //         // re-showing the dialog.
      //         selectedDate: _selecteddate1 ,
      //
      //         onChanged: (DateTime dateTime) {
      //           // close the dialog when year is selected.
      //
      //           Navigator.pop(context);
      //
      //           // Do something with the dateTime selected.
      //
      //           setState(() {
      //             _dateTime =dateTime as String;
      //             date_1  =dateTime as String ;
      //           });
      //           // Remember that you need to use dateTime.year to get the year
      //         },
      //       ),
      //     ),
      //   );
      //
      //
      // },
    //);



  }
  // List<String> items= <String>[
  //   'Siva', 'Safi', 'Patience', 'Joel', 'Mado', 'Solange', 'Son'
  // ];
  // String dropdownValue ='Siva';


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

            height: MediaQuery.of(context).size.height*0.17,
            //width: MediaQuery.of(context).size.width*0.33,
            color: Colors.white,

            child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // DropdownButton<String>(
                  //   onChanged: (String? newValue){
                  //     setState((){
                  //       dropdownValue = newValue!;
                  //     });
                  //     dropdownValue = newValue!;
                  //   },
                  //   value: dropdownValue,
                  //   items: items.map<DropdownMenuItem<String>>(
                  //       (String value) {
                  //         return DropdownMenuItem<String>(
                  //           value: value,
                  //           child: Text(value),
                  //         );
                  //       }
                  //   ).toList(),
                  // ),




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
                            Text('Du :  ', //$_selectedYear
                              style: TextStyle(fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),),

                            const Spacer(),


                            GestureDetector(
                              onTap: (){
                                //_selectedDate(context);
                                //     _selectedYear(context);
                              },

                              child: const Icon(Icons.calendar_month, size: 40),

                            ),



                            Text('    Au :  ', //$_selectedYear
                              style: TextStyle(fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),),

                            const Spacer(),

                            GestureDetector(
                              onTap: (){

                              //  _selectedDate ;

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
                      children: [
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
                  //future: ImportateurReleveModel.getReleveImp(Compte, date_1, date_2),


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
                        return ListTile(
                          title: Text(' ',
                            //importObject.designationGroupe.toString(),
                            style: TextStyle(fontSize: 11),),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(releveObject.numCompte.toString()),
                              // Text(releveObject.charge.toString()),
                              // Text(releveObject.produit.toString()),
                              // Text(releveObject.rsultat.toString()),
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
//}
