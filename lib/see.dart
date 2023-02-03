import 'package:flutter/material.dart';

class Accueil extends StatefulWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  @override
  Widget build(BuildContext context) {
    final double height= MediaQuery.of(context).size.height;
    final double width= MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body:


      //__________________________________
      //CREATION DE NOTRE COLLONE PRINCIPALE  /
      //_________________________________________

      Column(
        children: [

          //__________________________________
          //PREMIER CONTENU DE LA COLLONE    /
          //__________________________________
          Container(
            height: 230,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                ),
                color: Color(0xFF363f93),
                boxShadow: [
                  new BoxShadow(

                    //________________
                    //Reglage OPACITE/
                    //_______________

                      color: Colors.blue.withOpacity(0.3),
                      offset: new Offset(-10.0, 0.0),
                      blurRadius: 20.0,
                      spreadRadius: 4.0),
                ]
            ),

            //____________________
            //CONTENU DANS CONTENU/
            //____________________

            child: Stack(
              children: [
                Positioned(
                  top: 80,
                  left: 0,
                  child: Container(
                    height: 100,
                    width: 300,
                    decoration: BoxDecoration(color: Colors.white,
                        borderRadius: BorderRadius.only(
                          //topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        )
                    ),
                  ),
                ),
                Positioned(
                  top: 110,
                  left: 20,
                  child: Text("Your Books",
                    style: TextStyle(fontSize: 30,
                        color: Color(0xFF363f93) ),),)
              ],
            ),
          ),
          SizedBox(height: height*0.05,),


          //_________________________
          //l'AUTRE CONTAINNER PARENT/
          //________________________

          Container(
            height: 230,
            child: Stack(
              children: [
                Positioned(
                    top: 30,
                    left: 20,


                    child: Material(

                      child: Container(
                        height: 108.0,
                        width: width*0.9,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(0.0),
                            //OMBRE DU BORDURE
                            boxShadow: [
                              new BoxShadow(
                                //Reglage OPACITE
                                  color: Colors.blue.withOpacity(0.3),
                                  offset: new Offset(-10.0, 0.0),
                                  blurRadius: 20.0,
                                  spreadRadius: 4.0),
                            ]

                        ),
                      ),

                    )),
                Positioned(
                    top: 0,
                    left: 30,
                    child: Card(
                      elevation: 10.0,
                      shadowColor: Colors.grey.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),

                      //__________________________
                      //CONTAINER POUR L'IMAGE///
                      //________________________

                      child: Container(
                        height: 200,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              fit:BoxFit.fill,
                              image: AssetImage("images/avatar.jpg"),
                            )

                        ),
                      ) ,
                    )
                ),

                //___________________________________________________________________
                //INSERTION D'AUTRE CONTAINER AVEC DES ECRIT EN RAPPORT AVEC L'IMAGE /
                //__________________________________________________________________


                Positioned(
                    top: 60,
                    left:200 ,

                    child:
                    Container(
                      height: 150,
                      width: 160,
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start ,
                        children: [
                          Text("Big Miracles", style: TextStyle(
                              fontSize: 20,
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold
                          ),),

                          Text("Gracieux S", style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold
                          ),),

                          //_____________________________
                          //TRACER LA LIGNE APRES TEXTE /
                          //____________________________

                          Divider(color: Colors.black),
                          Text("It's lager than life", style: TextStyle(
                              fontSize: 20,
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold
                          ),),

                        ],
                      ),
                    )
                )
              ],
            ),
          ),

          //_________________________________________
          //L'AUTRE CONTENEUR EN DESSOUS DE L'IMAGE  /
          //_________________________________________

          Expanded(
              child: MediaQuery.removePadding(context: context,
                removeTop: true,
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10, top: 25),
                      height: 200,
                      padding:
                      EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      child: Container(

                        //LE REMBLISSAGE DU CONTENEUR COMME BACK GROUND
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(80.0),
                          ),
                          boxShadow: [
                            new BoxShadow(
                              //Reglage OPACITE
                                color: Colors.blue.withOpacity(0.3),
                                offset: new Offset(-10.0, 0.0),
                                blurRadius: 20.0,
                                spreadRadius: 4.0),
                          ],
                        ),
                        padding: EdgeInsets.only(
                          left: 32,
                          top: 50.0,
                          bottom: 50,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("THE BEST",
                              style: TextStyle(color: Colors.white,
                                  fontSize: 12),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text("Your life starts here",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                            //
                          ],
                        ),
                      ),
                    ),
                    //SizedBox(height: height*0.5,),
                    Container(
                      margin: EdgeInsets.only(bottom: 10, top: 25),
                      height: 200,
                      padding:
                      EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      child: Container(

                        //LE REMBLISSAGE DU CONTENEUR COMME BACK GROUND
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(80.0),
                          ),
                          boxShadow: [
                            new BoxShadow(
                              //Reglage OPACITE
                                color: Colors.blue.withOpacity(0.3),
                                offset: new Offset(-10.0, 0.0),
                                blurRadius: 20.0,
                                spreadRadius: 4.0),
                          ],
                        ),
                        padding: EdgeInsets.only(
                          left: 32,
                          top: 50.0,
                          bottom: 50,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("THE BEST",
                              style: TextStyle(color: Colors.white,
                                  fontSize: 12),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text("Your life starts here",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                            //
                          ],
                        ),
                      ),
                    ),


                  ],
                ) ,)

          )
        ],
      ),
    );

  }
}
