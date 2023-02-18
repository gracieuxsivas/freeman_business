import 'package:flutter/material.dart';
import 'package:freeman_business/Models/compteModel.dart';

class Balance extends StatefulWidget {
  const Balance({Key? key}) : super(key: key);
//int bal ;
//Balance({ required this.bal});

  @override
  State<Balance> createState() => _BalanceState();
}

class _BalanceState extends State<Balance> {
  //int get bal => bal;
  //int bal=0;


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
                Text('GROUPE DE BALANCE',
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
            padding: EdgeInsets.fromLTRB(10, 4, 10, 0),
           // padding: EdgeInsets.fromLTRB(10, 35, 10, 0),
            height: 40,
            //height: 125,
            color: Colors.blue,


            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
                children: [



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

                // TextFormField(),

                ]

            ),

          ),

          //Donnees Balances From API


          Expanded(
              child: FutureBuilder<List<CompteModel>>(
                  future: CompteModel.getBalancedeGroupe(),
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
                        CompteModel balanceObject = snapshot.data![index];

                        //iteration de la liste
                        return ListTile(
                          title: Text(' ',
                            //importObject.designationGroupe.toString(),
                            style: TextStyle(fontSize: 11),),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(balanceObject.designationGroupe.toString()),
                              Text(balanceObject.numCompte.toString()),
                              Text(balanceObject.solde.toString()),
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
