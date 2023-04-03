import 'package:flutter/material.dart';

import 'DossierPrincipal.dart';
import 'model_list_file.dart';

class NouveauDossier extends StatefulWidget {
  const NouveauDossier({Key? key}) : super(key: key);

  @override
  State<NouveauDossier> createState() => _NouveauDossierState();
}

class _NouveauDossierState extends State<NouveauDossier> {
  TextEditingController _designation= new TextEditingController();

  int etat=0;
  String designation= "";


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
        //toolbarHeight: 40,
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
                    IconButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => DossierPrinc(etat: etat, designation: _designation.text,) )
                      );
                    },
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

          SizedBox(height: 15,),

          Container(
            padding: EdgeInsets.fromLTRB(5, 4, 5, 0),
            child: Card(

              child: TextFormField(
                //controller: usernameController,
                controller: _designation,
                style: TextStyle (fontSize: 17) ,

                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(10),
                    prefixIcon: Padding (padding: EdgeInsets.only(left: 20, right: 15),

                    ),
                    labelText: "Designation",
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








