import 'package:flutter/material.dart';
import 'package:freeman_business/Models/compteModel.dart';



class Importateur extends StatefulWidget {
  //const Importateur({Key? key}) : super(key: key);
  int import;
  Importateur({ required this.import});

  @override
  State<Importateur> createState() => _ImportateurState(import:import);
}

class _ImportateurState extends State<Importateur> {
  int import=0;
  _ImportateurState({required this.import});



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
                 Text('IMPORTATEURS',
                   style: TextStyle(fontSize: 15,
                       color: Colors.white,
                       fontWeight: FontWeight.bold),
                 ),
                 const Spacer(),
                 IconButton(onPressed: () {},
                     icon: Icon(Icons.search,
                         color: Colors.white)),
                 const Spacer(),
                 IconButton(onPressed: () {
                   //Navigator.PushNamed(context, routeName)
                   Navigator.pushNamed(context, '/nouveau_compte_importateur');
                 },
                     icon: Icon(Icons.add,
                         color: Colors.white)),
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
                        Text('Designation',
                          style: TextStyle(fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),),
                        const Spacer(),
                        Text('Compte',
                          style: TextStyle(fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),),
                        const Spacer(),
                        Text('Solde',
                          style: TextStyle(fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),),
                      ]),


                  //LISTE DES IMPORTATEURS


                  // TextFormField(),
                ]

            ),

          ),


//AFFICHAGE DES DONNEES FROM API
          Expanded(
              child: FutureBuilder<List<CompteModel>>(
                  future: CompteModel.getImportateurModel(import),
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
                        CompteModel importObject = snapshot.data![index];

                        //iteration de la liste
                        return ListTile(
                          title: Text(' ',
                            //importObject.designationGroupe.toString(),
                            style: TextStyle(fontSize: 11),),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(importObject.designationCompte.toString()),
                              Text(importObject.numCompte.toString()),
                              Text(importObject.solde.toString()),
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
