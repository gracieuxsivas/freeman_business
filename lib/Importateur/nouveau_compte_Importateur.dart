import 'package:flutter/material.dart';

import '../Dossier/model_list_file.dart';

class NouveauCompteImportateur extends StatefulWidget {
  const NouveauCompteImportateur({Key? key}) : super(key: key);

  @override
  State<NouveauCompteImportateur> createState() => _NouveauCompteImportateurState();
}

class _NouveauCompteImportateurState extends State<NouveauCompteImportateur> {



  @override
  Widget build(BuildContext context) {
    //final double height= MediaQuery.of(context).size.height;
    //final double width= MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 10,
        centerTitle: true,
        toolbarHeight: MediaQuery.of(context).size.height*0.06,
        title:
        Column(
          // crossAxisAlignment: CrossAxisAlignment.end,

            children: [
              Row(
                  children: [

                    Text('NOUVEAU DOSSIER',
                      style: TextStyle(fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),

                    const Spacer(),
                    IconButton(onPressed: () {},
                        icon: Icon(Icons.save,
                            color: Colors.white)),
                  ]),

              // SizedBox(height: 10,),

            ]),
      ),

      backgroundColor: Colors.grey[300],

      body:
      Column(
        children: [
          // Container(
          //   padding: EdgeInsets.fromLTRB(5, 4, 5, 0),
          //   //height: 50,
          //   color: Colors.blue,
          //
          //   child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.end,
          //       children: [
          //
          //         SizedBox(height: 10,),
          //
          //         Card(
          //           child: Row(
          //             //crossAxisAlignment: CrossAxisAlignment.end,
          //               mainAxisAlignment: MainAxisAlignment.end,
          //
          //               children: [
          //                 IconButton(onPressed: () {},
          //                     icon: Icon(Icons.arrow_drop_down_outlined,
          //                         color: Colors.black)),
          //
          //                 //const Spacer(),
          //
          //                 IconButton(onPressed: () {},
          //                     icon: Icon(Icons.playlist_add,
          //                         color: Colors.black)),
          //               ]),
          //         ),
          //
          //       ]),
          //
          // ),

          //Autre Mise en former

          Container(
            padding: EdgeInsets.fromLTRB(5, 4, 5, 0),
            child: Card(

              child: TextFormField(
                //controller: usernameController,
                style: TextStyle (fontSize: 17) ,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    prefixIcon: Padding (padding: EdgeInsets.only(left: 20, right: 15),

                    ),
                    labelText: "Libelé",
                    hintText: "  "
                ),
                keyboardType: TextInputType.text,
              ),
            ),
          ),
          SizedBox(height: 12,),

          Container(
            padding: EdgeInsets.fromLTRB(5, 4, 5, 0),
            child: Card(

              child: TextFormField(
                //controller: usernameController,
                style: TextStyle (fontSize: 17) ,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    prefixIcon: Padding (padding: EdgeInsets.only(left: 20, right: 15),

                    ),
                    labelText: "Numero du compte",
                    hintText: "  "
                ),
                keyboardType: TextInputType.text,
              ),
            ),
          ),




        ],
      ),
    );
  }
}








