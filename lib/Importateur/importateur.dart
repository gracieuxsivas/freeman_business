import 'package:flutter/material.dart';

class Importateur extends StatefulWidget {
  const Importateur({Key? key}) : super(key: key);

  @override
  State<Importateur> createState() => _ImportateurState();
}

class _ImportateurState extends State<Importateur> {
  List<String> importateursList= [
    'Importateurs ici',
  ];
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
         toolbarHeight: 50,
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
                 IconButton(onPressed: () {},
                     icon: Icon(Icons.add,
                         color: Colors.white)),
               ]),

               //SizedBox(height: 10,),

               // Row(children: [
               //   Text('Designation',
               //     style: TextStyle(fontSize: 15),),
               //   const Spacer(),
               //   Text('Compte',
               //     style: TextStyle(fontSize: 15),),
               //   const Spacer(),
               //   Text('Solde',
               //     style: TextStyle(fontSize: 15),),
               // ]),

               // TextFormField(),
             ]),
        ),



      body:
      Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 2, 10, 0),
            height: 40,
            color: Colors.blue,


            //     decoration: BoxDecoration(
            //     borderRadius: BorderRadius.only(
            //     bottomRight: Radius.circular(0),
            // ),
            // color: Colors.blue,
            //         boxShadow: [
            //           new BoxShadow(
            //             //________________
            //             //Reglage OPACITE/
            //             //_______________
            //
            //               color: Colors.blue.withOpacity(0.3),
            //               offset: new Offset(-10.0, 0.0),
            //               blurRadius: 20.0,
            //               spreadRadius: 4.0),
            //         ]
            //     ),

            child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  Row(children: [
                    // Icon(Icons.arrow_back,
                    //   color: Colors.white,),
                    // const Spacer(),
                    // Text('IMPORTATEURS',
                    //   style: TextStyle(fontSize: 15,
                    //       color: Colors.white,
                    //       fontWeight: FontWeight.bold),
                    // ),
                    // const Spacer(),
                    // IconButton(onPressed: () {},
                    //     icon: Icon(Icons.search,
                    //         color: Colors.white)),
                    // const Spacer(),
                    // IconButton(onPressed: () {},
                    //     icon: Icon(Icons.add,
                    //         color: Colors.white)),
                    // //Icon(Icons.search),

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
          ListView(
            padding: EdgeInsets.all(10),
            shrinkWrap: true,
            children: [
              Card(
                child: Column(

                  children:  importateursList.map((encours) => Text(encours),
                  ).toList(),

                ),
              ),
            ]
            ,),

          Card(
            child: ListTile(
              title: Text("Title here"),
              subtitle: Text("Description"),
            ),
          )
        ],
      ),




    );
  }
}
