import 'package:flutter/material.dart';

class VoirEvolution extends StatefulWidget {
  const VoirEvolution({Key? key}) : super(key: key);

  @override
  State<VoirEvolution> createState() => _VoirEvolutionState();
}

class _VoirEvolutionState extends State<VoirEvolution> {
  @override
  Widget build(BuildContext context) {
    //final double height= MediaQuery.of(context).size.height;
    //final double width= MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.blue[700],
          title: Text("Evolution"),
          centerTitle: true,
          elevation: 0,
        ),

        body:

        Column(
          children: [
            Container(
              child: (
              OutlinedButton.icon(

                  onPressed: (){
                    Navigator.pushNamed(context, '/recherche_du_compte');
                  },
                  style: OutlinedButton.styleFrom( backgroundColor: Colors.white,
                    shape: StadiumBorder(),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    //side: BorderSide(width: 2, color: Colors.white),
                  ),
                  icon: Icon (Icons.keyboard_arrow_right,size: 30,
                              color: Colors.black,),
                  label: Text("Recherche du compte",
                              style: TextStyle(color: Colors.grey,),))
              ),

            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(10),
                children: [
                  Card(
                    elevation: 15,
                    shadowColor: Colors.blue,
                    child:
                       // Padding(padding: EdgeInsets.all(10)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Facturation importateur",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )
                          ),
                          Divider(height: 10.0,
                          color: Colors.grey[700],),
                          Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                            children: [
                              Text("Facture here",
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize:9,
                              ),),
                              const SizedBox(width:10 ,),
                              const Icon(Icons.article, size: 40,),
                            ],
                          )
                        ],
                      ),
                    ),

                  ),
    //________________________________________________________________
    //L'AUTRE CARD 2 ICI

                  Card(
                    elevation: 15,
                    shadowColor: Colors.blue,

                    child:
                    // Padding(padding: EdgeInsets.all(10)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          const Text("Frais de dossier",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          Divider(height: 10.0,
                            color: Colors.grey[700],),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                            children: [
                              Text("Plan de voyage here",
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize:9,
                                ),),
                              SizedBox(width:10 ,),
                              Icon(Icons.today, size: 40,),
                            ],


                          )
                        ],


                      ),
                    ),

                  ),

                  //________________________________________________________________
                  //L'AUTRE CARD 3 ICI

                  Card(
                    elevation: 15,
                    shadowColor: Colors.blue,

                    child:
                    // Padding(padding: EdgeInsets.all(10)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text("Caisse (Solde)",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          Divider(height: 10.0,
                            color: Colors.grey[700],),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                            children: [
                              Text("caisse here",
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize:9,
                                ),),
                              SizedBox(width:10 ,),
                              Icon(Icons.attach_money, size: 40,),
                            ],


                          )
                        ],


                      ),
                    ),

                  ),
                  //________________________________________________________________
                  //L'AUTRE CARD 4 ICI

                  Card(
                    elevation: 15,
                    shadowColor: Colors.blue,

                    child:
                    // Padding(padding: EdgeInsets.all(10)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text("Banque(Solde)",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          Divider(height: 10.0,
                            color: Colors.grey[700],),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                            children: [
                              Text("Banque here",
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize:9,
                                ),),
                              SizedBox(width:10 ,),
                              Icon(Icons.account_balance, size: 40,),
                            ],

                          )
                        ],

                      ),
                    ),

                  ),
                  //________________________________________________________________
                  //L'AUTRE CARD 5 ICI

                  Card(
                    elevation: 15,
                    shadowColor: Colors.blue,

                    child:
                    // Padding(padding: EdgeInsets.all(10)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text("Importateur",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          Divider(height: 10.0,
                            color: Colors.grey[700],),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                            children: [
                              Text("Client here",
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize:9,
                                ),),
                              SizedBox(width:10 ,),
                              Icon(Icons.shopping_cart, size: 40,),
                            ],
                          )
                        ],
                      ),
                    ),

                  ),

                  //________________________________________________________________
                  //L'AUTRE CARD 6 ICI

                  Card(
                    elevation: 15,
                    shadowColor: Colors.blue,

                    child:
                    // Padding(padding: EdgeInsets.all(10)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text("Fournisseur(Solde)",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          Divider(height: 10.0,
                            color: Colors.grey[700],),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                            children: [
                              Text("Fornisseur here",
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize:9,
                                ),),
                              SizedBox(width:10 ,),
                              Icon(Icons.local_shipping, size: 40,),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

    //_______________________________________________________
                  //CONTAINER DU BOUTON

                  Container(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // FlatButton(onPressed: (){}, child:
                        // Text("Annulé", style:
                        // TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold),)),
                      ],
                    ),
                  )
                ],
              ),

            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,
              width: double.infinity,//<= Match parent
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                onPressed: (){},
                //color: Colors.blue[700],
                child: Text(
                  "VOIR LE GRAPHIQUE",
                  style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),),
              ),

            )
          ],
        ),
    );
  }
}
