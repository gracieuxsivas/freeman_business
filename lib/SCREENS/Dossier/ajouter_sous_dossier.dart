import 'package:flutter/material.dart';
import 'package:freeman_business/Models/Posts/AjouterSousDossier_Model.dart';

import 'model_list_file.dart';

class AjouterDossier extends StatefulWidget {
  const AjouterDossier({Key? key}) : super(key: key);

  @override
  State<AjouterDossier> createState() => _AjouterDossierState();
}

bool isLoading = false;

class _AjouterDossierState extends State<AjouterDossier> {
  TextEditingController _NumPlaque= new TextEditingController();
  TextEditingController _NumDeclaration= new TextEditingController();
  TextEditingController _AutreNumero= new TextEditingController();
  TextEditingController _Date= new TextEditingController();
  TextEditingController _Reference= new TextEditingController();
  TextEditingController _commentaire= new TextEditingController();

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
                    Text('AJOUTER DOSSEIR',
                      style: TextStyle(fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),

                    const Spacer(),
                    IconButton(onPressed: () {
                      SousDossier dossierPV = SousDossier(
                        plaque: _NumPlaque.text.toString(),
                        numeroDeclaration: _NumDeclaration.text.toString(),
                        autreNumero: _AutreNumero.text.toString(),
                        datePv: _Date.text.toString(),
                        designationPv: _Reference.text.toString(),
                        detailPV: _commentaire.text.toString(),

                      );

                      setState(() {
                        isLoading = true;
                      });

                      SousDossier.enregistrement(dossierPV).then((value) {
                        setState(() {
                          isLoading = false;
                        });

                        //REPONSE SERVEUR:>>
                        if (value == "200") {
                          //enregistrement reussie avec success
                          Navigator.of(context).pop();
                        } else {
                          //echec d'eregistrement
                        }
                      });
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
          Container(
            padding: EdgeInsets.fromLTRB(5, 4, 5, 0),
            //height: 50,
            color: Colors.blue,


            child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  SizedBox(height: 10,),

                  Card(
                    child: Row(
                        //crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,

                        children: [
                          IconButton(onPressed: () {},
                              icon: Icon(Icons.arrow_drop_down_outlined,
                                  color: Colors.black)),

                          //const Spacer(),

                          IconButton(onPressed: () {
                            Navigator.pushNamed(context, '/nouveau_importateur');
                          },
                              icon: Icon(Icons.playlist_add,
                                  color: Colors.black)),
                        ]),
                  ),

                ]),

          ),

          //Autre Mise en former

          Container(
            padding: EdgeInsets.fromLTRB(5, 4, 5, 0),
            child: Card(

              child: TextFormField(
                controller: _NumPlaque,
                style: TextStyle (fontSize: 17) ,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    prefixIcon: Padding (padding: EdgeInsets.only(left: 20, right: 15),

                    ),
                    border: OutlineInputBorder(),
                    labelText: "Numero Plaque",
                    hintText: " "
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
                controller: _NumDeclaration,
                style: TextStyle (fontSize: 17) ,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    prefixIcon: Padding (padding: EdgeInsets.only(left: 20, right: 15),

                    ),
                    border: OutlineInputBorder(),
                    labelText: "Numero Déclaration",
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
                controller: _AutreNumero,
                style: TextStyle (fontSize: 17) ,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    prefixIcon: Padding (padding: EdgeInsets.only(left: 20, right: 15),

                    ),
                    border: OutlineInputBorder(),
                    labelText: "Autre Numéro",
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
                controller: _Date,
                style: TextStyle (fontSize: 17) ,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    prefixIcon: Padding (padding: EdgeInsets.only(left: 20, right: 15),

                    ),
                   // border: OutlineInputBorder(),
                    labelText: "Date ",
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
                controller: _Reference,
                style: TextStyle (fontSize: 17) ,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    prefixIcon: Padding (padding: EdgeInsets.only(left: 20, right: 15),

                    ),
                    border: OutlineInputBorder(),
                    labelText: "Reference ",
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
                controller: _commentaire,
                style: TextStyle (fontSize: 17) ,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    prefixIcon: Padding (padding: EdgeInsets.only(left: 20, right: 15),

                    ),
                    border: OutlineInputBorder(),
                    labelText: "Commentaire ",
                    hintText: "  "
                ),
                keyboardType: TextInputType.text,
              ),
            ),
          ),

         isLoading?CircularProgressIndicator():Container()

        ],
      ),
    );
  }
}
