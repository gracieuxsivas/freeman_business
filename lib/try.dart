// // import 'package:flutter/material.dart';
// // import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// // import 'package:focused_menu/focused_menu.dart';
// // import 'package:focused_menu/modals.dart';
// //
// //
// // void main() {
// //   runApp(MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Demo',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: MyHomePage(),
// //     );
// //   }
// // }
// //
// // class MyHomePage extends StatefulWidget {
// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }
// //
// // class _MyHomePageState extends State<MyHomePage> {
// //
// //   //String dropdownvalue = 'Apple';
// //  // var items =  ['Apple','Banana','Grapes','Orange','watermelon','Pineapple'];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("Focussed Menu"),
// //       ),
// //
// //       backgroundColor: Colors.grey[900],
// //       body: Container(
// //
// //         child: Padding(
// //         padding: EdgeInsets.all(15),
// //           child: //StaggeredGridView.countBuild
// //           Column (
// //             children: [
// //               Row(
// //                 crossAxisAlignment: CrossAxisAlignment.center,
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   Text('Focused Popup')
// //                 ],
// //               ),
// //               Expanded(
// //                   child: GridView(
// //                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
// //                     children: [1, 2, 3, 4, 5, 6, 7, 8,9,10,11,12].map((e) =>
// //                         FocusedMenuHolder(
// //                           //Brur =Filgrane(surbrillance)
// //                           menuWidth: MediaQuery.of(context).size.width*0.5,//<= prendre la moitier de la largeur ecran
// //                           menuItemExtent: 50, //<Pour la hauteur
// //                           animateMenuItems: false,
// //                           duration: Duration(microseconds: 500 ),
// //                           menuBoxDecoration: BoxDecoration(color: Colors.blue),
// //                           blurSize: 4,
// //                           blurBackgroundColor: Colors.white,
// //                           onPressed: (){},
// //                           menuItems: <FocusedMenuItem>[
// //                             FocusedMenuItem(title: Text("Dossier Envoye "), onPressed: (){}, trailingIcon: Icon(Icons.add)),
// //                             FocusedMenuItem(title: Text("Dossier recu "), onPressed: (){}, trailingIcon: Icon(Icons.share), backgroundColor: Colors.redAccent),
// //                           ],
// //                           child: Card(
// //                       child: Image.asset("images/logo.png") ,),
// //                         ) ).toList(),
// //
// //
// //                   ))
// //             ],
// //
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// import 'package:flutter/material.dart';
//
// import '../../Models/compteModel.dart';
// import '../Importateur/Import_releve.dart';
// import 'Models/ListeGroupCompte_Model.dart';
//
// class TryClass extends StatefulWidget {
//   //const Banque({Key? key}) : super(key: key);
//   int numCompte;
//
//   TryClass({required this.numCompte});
//
//   @override
//   State<TryClass> createState() => _TryClassState(numCompte:numCompte);
// }
//
// class _TryClassState extends State<TryClass> {
//   int numCompte=411;
//   _TryClassState ({required this.numCompte});
//
// //List data = [];
// int _value =1;
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     //getData;
//     //final double height= MediaQuery.of(context).size.height;
//     //final double width= MediaQuery.of(context).size.width;
//
//
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.blue,
//         centerTitle: true,
//         toolbarHeight: 50,
//         title:
//         Column(
//
//             crossAxisAlignment: CrossAxisAlignment.end,
//
//             children: [
//               Row(children: [
//                 //Icon(Icons.arrow_back),
//                 Text('COMPTES',
//                   style: TextStyle(fontSize: 15,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 const Spacer(),
//                 IconButton(onPressed: () {},
//                     icon: Icon(Icons.search,
//                         color: Colors.white)),
//
//               ]),
//
//               //SizedBox(height: 10,),
//
//
//             ]),
//       ),
//       backgroundColor: Colors.grey[300],
//
//       body:
//
//       Column(
//         children: [
//           Container(
//             padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
//             height: 40,
//             color: Colors.blue,
//
//
//             child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//
//                   Row(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Text('Designation',
//                           style: TextStyle(fontSize: 15,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold),),
//                         const Spacer(),
//
//                       ]),
//
//                   // TextFormField(),
//                 ]),
//           ),
//
//
//           Expanded(
//               child: FutureBuilder<List<ListeGroupeCompte>>(
//                   future: ListeGroupeCompte.getComptes(numCompte),
//                   builder: (context, snapshot) {
//
//                     //Chargement des donnees
//                     if (!snapshot.hasData) {
//                       return Center(
//                         child: Container(
//                             margin: const EdgeInsets.all(20),
//                             child:  const CircularProgressIndicator(
//                               color: Colors.blue,
//                             )),
//                       );
//                     }
//                     //Quand la methode renvoie les donnees
//
//                     if (snapshot.data!.length == 0) {
//
//                       //si la taille de la liste est 0, on affiche un message : aucune donnee disponible
//                       return Center(
//                         child: Container(
//                           margin: const EdgeInsets.all(20),
//                           child:  Column(
//                             // mainAxisAlignment: MainAxisAlignment.center,
//                             children: const [
//                               Text(
//                                 "aucune donnée disponible",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.normal,
//                                     fontSize: 20,
//                                     fontStyle: FontStyle.italic),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     }
//                     //affichage de la liste renvoi par la methode, au cas ou la liste contient des donnees
//                     return DropdownButton(
//
//                       items:data.map((e) {
//                         return DropdownMenuItem(child: Text(e["designationCompte"]), value: e["numCompte"],);
//                       }).toList(),
//
//                       value: numCompte,
//                       onChanged: (v){
//                         numCompte = v as int;
//                         setState(() {
//                         });
//                       },
//
//                     );
//                   })
//           ),
//         ],
//       ),
//
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';


class TryClass extends StatefulWidget {
  const TryClass({Key? key}) : super(key: key);

  @override
  _TryClassState createState() => _TryClassState();
}

class _TryClassState extends State<TryClass> {

  List Importlist = [];


//METHODE POUR API
  Future getComptes() async {
    final Url = "http://afrisofttech-003-site37.btempurl.com/api/Compte/listedeCompteParGroupe?groupeCompte=411";

    http.Response response = await http.get(Uri.parse(Url));

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        Importlist = jsonData;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getComptes();
  }

  var dropdownvalue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DropDown List"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              hint: Text('Import'),
              items: Importlist.map((item) {
                return DropdownMenuItem(
                  value: item['designationCompte'].toString(),
                  child: Text(item['designationCompte'].toString()),
                );
              }).toList(),
              onChanged: (newVal) {
                setState(() {
                  dropdownvalue = newVal;
                });
              },
              value: dropdownvalue,
            ),
          ],
        ),
      ),
    );
  }
}