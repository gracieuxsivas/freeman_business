import 'package:flutter/material.dart';

import '../../Models/dossiersPrinc_model.dart';
import 'model_list_file.dart';

class ModifierDossier extends StatefulWidget {
   String designationDossier;

  ModifierDossier( {required this.designationDossier});
  //const ModifierDossier({Key? key}) : super(key: key);

  @override
  State<ModifierDossier> createState() => _ModifierDossierState(designationDossier:designationDossier);
}

class _ModifierDossierState extends State<ModifierDossier> {


  _ModifierDossierState({required this.designationDossier});


  TextEditingController _designation= new TextEditingController();

  int etat=0;
  bool isLoading = false;
  String designationDossier ="";
  String text="";



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

                    Text('MODIFIER DOSSIER',
                      style: TextStyle(fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),

                    const Spacer(),
                    IconButton(onPressed: () {


                      Dossier Mod_dossier = Dossier(idDossier: 0,numDossier: "4434",designationDossier:
                      _designation.text.toString(),etat: true);

                      //________
                      // TextField(
                      //   onChanged: (value){
                      //     setState(() {
                      //       designationDossier=value;
                      //     });
                      //   },
                      //
                      // );
                      //______

                      setState(() {
                        isLoading = true;
                      });
                      Dossier.ModidicationDossier(Mod_dossier).then((value){
                        setState(() {
                          text=value;
                          isLoading = false;
                        });
                        if(value == "200"){
                          //enregistrement reussie avec success
                          Navigator.of(context).pop();
                        }else{
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

          SizedBox(height: 15,),

          Container(
            padding: EdgeInsets.fromLTRB(5, 4, 5, 0),
            child: Card(

              child: TextFormField(
                controller: _designation,
                style: TextStyle (fontSize: 17) ,

                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    prefixIcon: Padding (padding: EdgeInsets.only(left: 20, right: 15),

                    ),
                    border: OutlineInputBorder(),
                    labelText: "Designation",
                    hintText: "${designationDossier}"
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








