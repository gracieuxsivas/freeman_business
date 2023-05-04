import 'package:flutter/material.dart';
import 'package:freeman_business/Models/Posts/AjouterSousDossier_Model.dart';
import 'package:freeman_business/Models/dossiersPrinc_model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:intl/intl.dart';

class AjouterDossier extends StatefulWidget {
  Dossier dossier;
  AjouterDossier({Key? key,required this.dossier}) : super(key: key);

  @override
  State<AjouterDossier> createState() => _AjouterDossierState(dossier:dossier);
}

bool isLoading = false;

class _AjouterDossierState extends State<AjouterDossier> {

  Dossier dossier;
  _AjouterDossierState({required this.dossier});
  TextEditingController _importateurs= new TextEditingController();
  TextEditingController _NumPlaque= new TextEditingController();
  TextEditingController _NumDeclaration= new TextEditingController();
  TextEditingController _AutreNumero= new TextEditingController();
  TextEditingController _Date= new TextEditingController();
  TextEditingController _Reference= new TextEditingController();
  TextEditingController _commentaire= new TextEditingController();

  // List<String> items= <String>[
  //   'Boss Tabula', 'Declarant ADA', 'Declarant Deplick', 'Boss Manu', 'Compte papa Noble',
  //   'Compte papa Nzanzu Ouganda', 'Compte Honorable Honorable Sambuka', 'Compte Compte Honorable Honorable Sambuka',
  //   'Boss Kiyonga', 'Boss Japhete', 'Compte Kapele', 'Boss Muhamed', 'PDG John Bati', 'PDG Kisule',
  //   'PDG GRACE', 'Coopec la semence', 'Charge Feri', 'DGI kasindi', 'Boss Kitha', 'Receveur Dede Konzi'
  // ];
  // String dropdownValue ='Boss Tabula';


  List Importlist = [];
  //String dropdownValue ='Boss tabubula';
  int num_compte= 41002;


//Methode pour Api get import
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
  //DateTime _dateTime= DateTime.now();
  var dropdownvalue;

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
                        compte:"0",
                        codePV: "0",
                        etat: "",
                        numDossier: dossier.numDossier,
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
            padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
            
            //height: 50,
           // color: Colors.blue,

            child: Card(

//DROPDWN BUTTON

            //________________________________________
              child: TextFormField(
                controller: _importateurs,
                style: TextStyle (fontSize: 17) ,

                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    prefixIcon: Padding (padding: EdgeInsets.only(left: 20, right: 15),

                      child: DropdownButton(
                        hint: Text('Importateurs'),
                        isExpanded: true,
                        //alignment: Alignment.center,
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

                          if (Importlist != null){
                            _importateurs.text=dropdownvalue;
                          }
                        },
                        value: dropdownvalue,

                      ),
                    ),
                    border: OutlineInputBorder(),
                    labelText: "Importateurs",
                    hintText: " "
                ),
                keyboardType: TextInputType.text,

                //____________________________________________


              ),
            ),

          ),

          SizedBox(height: 12,),

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

                      child:
                      IconButton(onPressed: () async{
                        DateTime? pickeddate= await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2050),
                          );
                        if (pickeddate != null) {
                          _Date.text = DateFormat('yyyy-MM-dd').format(pickeddate);
                        }
                      },
                          icon: Icon(Icons.calendar_month,
                              color: Colors.grey,
                              size: 35 ,))

                    ),
                   border: OutlineInputBorder(),
                    labelText: "Date ",
                    hintText: " ",
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
