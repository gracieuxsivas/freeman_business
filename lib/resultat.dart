import 'package:flutter/material.dart';
import 'package:freeman_business/Models/resultatModel.dart';

class Resultat extends StatefulWidget {
  //const Resultat({Key? key}) : super(key: key);
  int resultatParAn;
  Resultat({required this.resultatParAn});

  @override
  State<Resultat> createState() => _ResultatState(resultatParAn: resultatParAn);
}

class _ResultatState extends State<Resultat> {

  _ResultatState({required this.resultatParAn});
  int resultatParAn=0;

  //VARIABLE POUR DATE TIME
  DateTime _selectedyear=DateTime.now();
//METHODE POUR SHOW DATE PICKER
  selectedYear(contect) async {
    print("Selecting year");
  }
  int annee = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    annee =  _selectedyear.year;
  }

  void _selectedYear(BuildContext context){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Année"),
          content: Container( // Need to use container to add size constraint.
            width: 300,
            height: 300,
            child: YearPicker(
              firstDate: DateTime(DateTime.now().year - 100, 1),
              lastDate: DateTime(DateTime.now().year + 100, 1),
              initialDate: DateTime.now(),
              // save the selected date to _selectedDate DateTime variable.
              // It's used to set the previous selected date when
              // re-showing the dialog.
              selectedDate: _selectedyear,
              onChanged: (DateTime dateTime) {
                // close the dialog when year is selected.

                Navigator.pop(context);

                // Do something with the dateTime selected.

                setState(() {
                  _selectedyear =dateTime;
                  annee  =dateTime.year;
                });
                // Remember that you need to use dateTime.year to get the year
              },
            ),
          ),
        );
      },
    );



  }
  @override
  Widget build(BuildContext context) {
    //final double height= MediaQuery.of(context).size.height;
    //final double width= MediaQuery.of(context).size.width;

    return Scaffold(
     appBar: AppBar(
       elevation: 0,
       title: const Text("TABLEAU DE RESULTAT PAR AN",
       style: TextStyle(
           fontSize:15,
           color: Colors.white,
           fontWeight: FontWeight.bold  ) ,),

       centerTitle: true
       ,


     ),

      backgroundColor: Colors.grey[300],

      body:

      Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 7, 10, 0),
            height: 100,
            color: Colors.blue,



            child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [



                  SizedBox(height: 5,),
                  Container(
                    padding: EdgeInsets.all(5),
                    //margin: EdgeInsets.all(0),
                    color: Colors.white,

                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        //mainAxisAlignment: MainAxisAlignment.end,

                        children: [
                          Text('Année : $annee ', //$_selectedYear
                            style: TextStyle(fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),),

                          const Spacer(),

                          GestureDetector(
                            onTap: (){
                              _selectedYear(context);
                            },

                            child: const Icon(Icons.calendar_month, size: 40),

                          )

                          // IconButton(onPressed: _selectedYear,
                          //     icon: Icon(Icons.calendar_month, size: 40,) )

                        ]
                    ),
                  ),

                  //SizedBox(height: 8,),

                  Row(

                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Mois',
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
                        const Spacer(),
                        Text('Resultat',
                          style: TextStyle(fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),),
                      ]),


                  // TextFormField(),
                ]),

          ),



          Expanded(
              child: FutureBuilder<List<ResultatModel>>(
                  future: ResultatModel.getResultat(annee),
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
                        ResultatModel resultatObject = snapshot.data![index];

                        //iteration de la liste
                        return ListTile(
                          title: Text(' ',
                            //importObject.designationGroupe.toString(),
                            style: TextStyle(fontSize: 11),),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(resultatObject.periode.toString()),
                              Text(resultatObject.charge.toString()),
                              Text(resultatObject.produit.toString()),
                              //Text(resultatObject.rsultat.toString()),
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
        height: 40,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),

          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Total :",
              style: TextStyle(fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),

        //TOTAL CHARGE
            Text("   ",
              style: TextStyle(fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),


            //TOTAL PRODUIT
            Text("   ",
              style: TextStyle(fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),

            //TOTAL Resultat
            Text("   ",
              style: TextStyle(fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),



          ],
        ),
      ),

    );
  }
}
