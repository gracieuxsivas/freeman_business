import 'package:flutter/material.dart';

import '../../Models/dossiersPrinc_model.dart';
import 'model_list_file.dart';

class ModifierDossier extends StatefulWidget {
  Dossier dossier;
  ModifierDossier( {required this.dossier});
  //const ModifierDossier({Key? key}) : super(key: key);

  @override
  State<ModifierDossier> createState() => _ModifierDossierState(dossier: dossier);
}

class _ModifierDossierState extends State<ModifierDossier> {

  Dossier dossier;

  _ModifierDossierState({required this.dossier});

  TextEditingController _designation= new TextEditingController();

  int etat=0;
  bool isLoading = false;
  String text="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _designation.text = dossier.designationDossier!;
  }



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

                      dossier.designationDossier = _designation.text.toString();

                      setState(() {
                        isLoading = true;
                      });
                      Dossier.ModidicationDossier(dossier).then((value){
                        setState(() {
                          text=value;
                          isLoading = false;
                        });
                        if(value == "200"){
                          //modification reussie avec success
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

      body: Column(
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
                    hintText: ""
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








