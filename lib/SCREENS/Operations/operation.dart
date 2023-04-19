import 'package:flutter/material.dart';

import 'operation_suite.dart';

class Operation extends StatefulWidget {
  const Operation({Key? key}) : super(key: key);

  @override
  State<Operation> createState() => _OperationState();
}

class _OperationState extends State<Operation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Text("Operation"),
        centerTitle: true,
        elevation: 0,
      ),
      //backgroundColor: Color.fromRGBO(44, 44, 44, 0.6),
      body: Center (
          child : SingleChildScrollView(
            child: Padding (padding: EdgeInsets.all(10),
              child: Column(
                children: [

                  Image(image: AssetImage("images/logo.png"), height: 200, width: 200,),

                  SizedBox(height: 20,),

                  //===============================================================
                  //L'AUTRE CONTAINER DES BOUTONS

                  Container(
                    padding: EdgeInsets.all(20),

                    child: SizedBox(
                      width: double.infinity,//<= Match parent
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [

                          SizedBox(
                            width: double.infinity,//<= Match parent
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                              ),

                              onPressed: (){
                                //Navigator.pushNamed(context, '/accueil');

                                Navigator.push(context,
                                    MaterialPageRoute(
                                        builder: (context) =>OperationSuite())

                                );
                              },
                              //color: Colors.blue,
                              child: Text(
                                "PAIEMENT",
                                style: TextStyle(fontSize: 15, color: Colors.white),),
                            ),
                          ),

                          SizedBox(height: 15,),//<= Espace entre widget

                          SizedBox(
                            width: double.infinity,//<= Match parent
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                              ),
                              onPressed: (){
                                Navigator.pushNamed(context, '/accueil');
                              },
                             // color: Colors.blue,
                              child: Text(
                                "AUTRE DEPENSE",
                                style: TextStyle(fontSize: 15, color: Colors.white),),
                            ),
                          ),

                          SizedBox(height: 15,),//<= Espace entre widget
                          SizedBox(
                            width: double.infinity,//<= Match parent
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                              ),
                              onPressed: (){
                                Navigator.pushNamed(context, '/accueil');
                              },
                              //color: Colors.blue,
                              child: Text(
                                "VERSEMENT BANQUE",
                                style: TextStyle(fontSize: 15, color: Colors.white),),
                            ),
                          ),

                          SizedBox(height: 15,),//<= Espace entre widget

                          SizedBox(
                            width: double.infinity,//<= Match parent
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                              ),
                              onPressed: (){
                                Navigator.pushNamed(context, '/accueil');
                              },
                              //color: Colors.blue,
                              child: Text(
                                "COMPTABILITE",
                                style: TextStyle(fontSize: 15, color: Colors.white),),
                            ),
                          ),

                          SizedBox(height: 15,),//<= Espace entre widget

                          SizedBox(
                            width: double.infinity,//<= Match parent
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                              ),
                              onPressed: (){
                                Navigator.pushNamed(context, '/accueil');
                              },
                              //color: Colors.blue,
                              child: Text(
                                "DEPENSE JOURNALIERE",
                                style: TextStyle(fontSize: 15, color: Colors.white),),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )

                ],
              ),
            ),
          )
      ),
    );
  }
}
