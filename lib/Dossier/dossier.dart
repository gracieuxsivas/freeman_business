import 'package:flutter/material.dart';

import '../model_list_file.dart';

class DossierEncours extends StatefulWidget {
  const DossierEncours({Key? key}) : super(key: key);

  @override
  State<DossierEncours> createState() => _DossierEncoursState();
}

class _DossierEncoursState extends State<DossierEncours> {
  List<ModelDossier_encours> list_dossier_en_cours= [
    ModelDossier_encours (designation: 'Designatio', charge: '    70', facture: 'Facture', resultat: 'Charge   '),
    //ModelDossier_encours (designation: '.........', charge: '888', facture: 'pppppdlkddlllllllll', resultat: '9986645')

  ];
  

  @override
  Widget build(BuildContext context) {
    //final double height= MediaQuery.of(context).size.height;
    //final double width= MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 50,
        title:
        Column(
            crossAxisAlignment: CrossAxisAlignment.end,

            children: [
              Row(
                  children: [

                Text('DOSSIER EN COURS',
                  style: TextStyle(fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),

                const Spacer(),
                IconButton(onPressed: () {},
                    icon: Icon(Icons.add,
                        color: Colors.white)),
              ]),

             // SizedBox(height: 10,),

            ]),
      ),

      backgroundColor: Colors.grey[300],

      body:
      Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 4, 10, 0),
            height: 50,
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
                        Text('Charge',
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

//LISTE DES DOSSIERS EN COURS


        // ListView.builder(
        //   itemCount: list_dossier_en_cours.length //A REVOIR
        //     ,
        //     itemBuilder: (context, index){
        //     return Padding(
        //       padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 40.0),
        //
        //       child: Card(
        //         child: ListView(
        //           children: [
        //             list_dossier_en_cours.map((ModelDossier_encours) =>Text(ModelDossier_encours)).toList(),
        //           ],
        //         ) ,
        //       ),
        //     );
        //
        //     })

          Card(
            margin: EdgeInsets.all(5),

            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: list_dossier_en_cours.map((encours)
                => Text(
                    '${encours.designation}             -'
                    '${encours.charge}          -     '
                    '${encours.facture}       -   '
                    '${encours.resultat}')).toList()
              ),
            ),
          )

          // ListView(
          //   padding: EdgeInsets.all(10),
          //   shrinkWrap: true,
          //   children: [
          //     Card(
          //       child: Column(
          //
          //         children:  list_dossier_en_cours.map((encours) => Text(encours)
          //         ).toList(),
          //
          //       ),
          //     ),
          //   ]
          //   ,)
        ],
      ),
    );
  }
}




//CLASS DOSSIER CLOTURE__________________________________________________________________________________________

class DossierCloture extends StatefulWidget {
  const DossierCloture({Key? key}) : super(key: key);

  @override
  State<DossierCloture> createState() => _DossierClotureState();
}

class _DossierClotureState extends State<DossierCloture> {
  @override
  Widget build(BuildContext context) {
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
              Row(
                  children: [

                    Text('DOSSIER CLOTURE',
                      style: TextStyle(fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),

                    const Spacer(),
                    // IconButton(onPressed: () {},
                    //     icon: Icon(Icons.add,
                    //         color: Colors.white)),
                  ]),

              // SizedBox(height: 10,),

            ]),
      ),
      backgroundColor: Colors.grey[300],


      body:
      Container(
        padding: EdgeInsets.fromLTRB(10, 2, 10, 0),
        height: 50,
        //height: 125,
        color: Colors.blue,

        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              Row(children: [
                // Icon(Icons.arrow_back,
                //   color: Colors.white,),
                // const Spacer(),
                // Text('DOSSIER CLOTURE',
                //   style: TextStyle(fontSize: 15,
                //       color: Colors.white,
                //       fontWeight: FontWeight.bold),
                // ),

                const Spacer(),
                // IconButton(onPressed: () {},
                //     icon: Icon(Icons.add,
                //         color: Colors.white)
                // ),
                //Icon(Icons.search),

              ]),

              SizedBox(height: 12,),

              Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Designa',
                      style: TextStyle(fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),),
                    const Spacer(),
                    Text('Charge',
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
    );
  }
}


