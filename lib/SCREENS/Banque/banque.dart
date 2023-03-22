import 'package:flutter/material.dart';

import '../../Models/compteModel.dart';
import '../Importateur/Import_releve.dart';

class Banque extends StatefulWidget {
  //const Banque({Key? key}) : super(key: key);
  int groupeCompteBanque;

  Banque({required this.groupeCompteBanque});

  @override
  State<Banque> createState() => _BanqueState(groupeCompteBanque:groupeCompteBanque);
}

class _BanqueState extends State<Banque> {
  int groupeCompteBanque=0;
  _BanqueState ({required this.groupeCompteBanque});

  String date_1="";
  String date_2="";


  @override
  Widget build(BuildContext context) {
    //final double height= MediaQuery.of(context).size.height;
    //final double width= MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        centerTitle: true,
        toolbarHeight: 50,
        title:
        Column(

            crossAxisAlignment: CrossAxisAlignment.end,

            children: [
              Row(children: [
                //Icon(Icons.arrow_back),
                Text('BANQUE',
                  style: TextStyle(fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(onPressed: () {},
                    icon: Icon(Icons.search,
                        color: Colors.white)),

              ]),

              //SizedBox(height: 10,),


            ]),
      ),
      backgroundColor: Colors.grey[300],

      body:

      Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            height: 40,
            color: Colors.blue,


                   child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [


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

                  // TextFormField(),
                ]),
          ),


          Expanded(
              child: FutureBuilder<List<CompteModel>>(
                  future: CompteModel.getBanqueGroupe(groupeCompteBanque),
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
                        CompteModel banqueObject = snapshot.data![index];

                        //iteration de la liste
                        return InkWell(
                          onTap: (){
                            setState(() {
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context) =>ImportReleve(Compte: banqueObject.numCompte!.toInt(), date_1, date_2, NumOperation: '',
                                          NomCompte: banqueObject.designationCompte.toString()))
                              );

                            });
                          },
                          child: ListTile(
                            title: Text(' ',
                              //importObject.designationGroupe.toString(),
                              style: TextStyle(fontSize: 11),),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(banqueObject.designationCompte.toString()),
                                Text(banqueObject.numCompte.toString()),
                                Text(banqueObject.solde.toString()),
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
