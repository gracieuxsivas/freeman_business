import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

class Accueil extends StatefulWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {


  //var items =  ['Dossiers en cours', 'Dossier cloturés'];

  @override
  Widget build(BuildContext context) {
    //final double height= MediaQuery.of(context).size.height;
    //final double width= MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 32,

      ),
      backgroundColor: Colors.grey[300],
      body: 
      Center(
        child: SingleChildScrollView(
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,


            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Card(
                    margin: EdgeInsets.all(5),
                    child: Container(
                      color: Colors.white,
                     padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(5),
                      height: 140,
                      width: 120,

                      child:
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.blue,
                              radius: 40,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: Icon(Icons.home,size: 50,),
                                color: Colors.white,
                                onPressed: () {
                                  Navigator.pushNamed(context, '/evolution');
                                },
                              ),
                            ),

                            Text("Accueil",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            ),
                            //SizedBox(height: 5,),
                            Divider(height: 12, color: Colors.grey[90],),
                            //SizedBox(height: 5,),
                            Text("Voir l'evolution",
                            style: TextStyle(
                              fontSize: 10,
                            ),
                                textAlign: TextAlign.center
                            ),

                          ],
                        )
                    ),
                  ),

            //_______2EME CARD_ CONTENANT FOCUSEDMENUHOLDER____ BTN DOSSIER_________________________

              Row(
                children: [
                  FocusedMenuHolder(
                      menuWidth: MediaQuery.of(context).size.width*0.5,//<= prendre la moitier de la largeur ecran
                      openWithTap: true,
                      blurSize: 4,
                      //borderRadius:BorderRadius.circular(20),
                      onPressed: (){},
                      menuItems: <FocusedMenuItem> [
                      FocusedMenuItem(title: Text("Dosser en cours"),
                          onPressed: () {Navigator.pushNamed(context, '/dossierencours');},
                          backgroundColor: Colors.orange[200]),

                      FocusedMenuItem(title: Text("Dosser cloturé"),
                          onPressed: () {Navigator.pushNamed(context, '/dossiercloture');}),
                    ],
                      child:
                            Card(
                              margin: EdgeInsets.all(5),
                              child: Container(
                                color: Colors.white,
                                padding: EdgeInsets.all(2),
                                margin: EdgeInsets.all(5),
                                height: 140,
                                width: 120,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,

                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.orange,
                                    radius: 40,

                                    child: Icon(

                                      Icons.folder,size: 50,
                                      color: Colors.white,

                                    ),
                                  ),

                                  Text("Dossier",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ), textAlign: TextAlign.center,),
                                  //SizedBox(height: 5,),
                                  Divider(height: 12, color: Colors.grey[90],),
                                  //SizedBox(height: 5,),
                                  Text("Les dossiers de déclaration",
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                      textAlign: TextAlign.center
                                  ),
                                ],
                              ),
                            ), )
                      ),
                ],
              ),
                ],
              ),

              //______________________________________
//->/DEUXIEME ROW_______________________________________________
              //______________________________________

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(

                    margin: EdgeInsets.all(5),
                    child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(5),
                        height: 140,
                        width: 120,

                        child:
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.green,
                              radius: 40,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: Icon(Icons.group,size: 50,),
                                color: Colors.white,
                                onPressed: () {
                                  Navigator.pushNamed(context, '/importateur');
                                },
                              ),
                            ),

                            Text("Importateur",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),),
                            //SizedBox(height: 5,),
                            Divider(height: 12, color: Colors.grey[90],),
                            //SizedBox(height: 5,),
                            Text("Voir les importateurs",
                              style: TextStyle(
                                fontSize: 10,
                              ),
                                textAlign: TextAlign.center
                            ),

                          ],
                        )
                    ),
                  ),

                  //______________________________________________

                  Card(

                    margin: EdgeInsets.all(5),
                    child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(5),
                        height: 140,
                        width: 120,

                        child:
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            CircleAvatar(
                              backgroundColor: Colors.blue,
                              radius: 40,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: Icon(Icons.work,size: 50,),
                                color: Colors.white,
                                onPressed: () {
                                  Navigator.pushNamed(context, '/operation');
                                },
                              ),
                            ),

                            Text("Opération",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),),
                            //SizedBox(height: 5,),
                            Divider(height: 12, color: Colors.grey[90],),
                            //SizedBox(height: 5,),

                            Text("Effectuer operation",
                              style: TextStyle(
                                fontSize: 10,
                              ),
                                textAlign: TextAlign.center
                            ),

                          ],
                        )

                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(

                    margin: EdgeInsets.all(5),
                    child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(5),
                        height: 140,
                        width: 120,

                        child:
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.blue,
                              radius: 40,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: Icon(Icons.balance,size: 50,),
                                color: Colors.white,
                                onPressed: () {
                                  Navigator.pushNamed(context, '/balance');
                                },
                              ),
                            ),

                            Text("Balance",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),),
                            //SizedBox(height: 5,),
                            Divider(height: 12, color: Colors.grey[90],),
                            //SizedBox(height: 5,),
                            Text("Balance de compte",
                              style: TextStyle(
                                fontSize: 10,
                              ),
                                textAlign: TextAlign.center
                            ),

                          ],
                        )
                    ),
                  ),

                  //______________________________________________

                  Card(

                    margin: EdgeInsets.all(5),
                    child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(5),
                        height: 140,
                        width: 120,

                        child:
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            CircleAvatar(
                              backgroundColor: Colors.orange,
                              radius: 40,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: Icon(Icons.temple_hindu,size: 50,),
                                color: Colors.white,
                                onPressed: () {
                                  Navigator.pushNamed(context, '/banque');
                                },
                              ),
                            ),

                            Text("Banque",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),),
                            //SizedBox(height: 5,),
                            Divider(height: 12, color: Colors.grey[90],),
                            //SizedBox(height: 5,),
                            Text("Voir la banque",
                              style: TextStyle(
                                fontSize: 10,
                              ),
                                textAlign: TextAlign.center
                            ),

                          ],
                        )

                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(

                    margin: EdgeInsets.all(5),
                    child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(5),
                        height: 140,
                        width: 120,

                        child:
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.blue,
                              radius: 40,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: Icon(Icons.streetview,size: 50,),
                                color: Colors.white,
                                onPressed: () {
                                  Navigator.pushNamed(context, '/resultat');
                                },
                              ),
                            ),

                            Text("Resultat",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),),
                            //SizedBox(height: 5,),
                            Divider(height: 12, color: Colors.grey[90],),
                            //SizedBox(height: 5,),
                            Text("Resultat par mois",
                              style: TextStyle(
                                fontSize: 10,
                              ),
                                textAlign: TextAlign.center),

                          ],
                        )
                    ),
                  ),

                  //______________________________________________

                  Card(

                    margin: EdgeInsets.all(5),
                    child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(5),
                        height: 140,
                        width: 120,

                        child:
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            CircleAvatar(
                              backgroundColor: Colors.orange,
                              radius: 40,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: Icon(Icons.library_books,size: 50,),
                                color: Colors.white,
                                onPressed: () {
                                  Navigator.pushNamed(context, '/livre_de_caisse');
                                },
                              ),
                            ),

                            Text("Livre de caisse",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),),
//SizedBox(height: 5,),
                            Divider(height: 12, color: Colors.grey[90],),
//SizedBox(height: 5,),
                            Text("Voir le livre de caisse",
                              style: TextStyle(
                                fontSize: 10,
                              ),
                                textAlign: TextAlign.center
                            ),

                          ],
                        )
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      )


    );
  }
}
