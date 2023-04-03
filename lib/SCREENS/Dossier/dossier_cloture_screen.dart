import 'package:flutter/material.dart';

//import '../Models/dossier_PV_Model.dart';
import 'model_list_file.dart';





//CLASS DOSSIER CLOTURE__________________________________________________________________________________________

class DossierCloture extends StatefulWidget {
  const DossierCloture({Key? key}) : super(key: key);

  @override
  State<DossierCloture> createState() => _DossierClotureState();
}

class _DossierClotureState extends State<DossierCloture> {

  List<ModelDossier_cloture> list_dossier_des_dossiers_cloture= [
    ModelDossier_cloture (designation: 'Designatio', charge: '    70', facture: 'Facture', resultat: 'Charge   '),

  ];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        centerTitle: true,
        toolbarHeight: MediaQuery.of(context).size.height*0.06,
        title:
        Column(
            crossAxisAlignment: CrossAxisAlignment.end,

            children: [
              Row(
                  children: [

                    Text('DOSSIER CLOTURE',
                      style: TextStyle(fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),

                    const Spacer(),
                    // IconButton(onPressed: () {},
                    //     icon: Icon(Icons.add,
                    //         color: Colors.white)),
                  ]),

              // SizedBox(height: 10,),

            ]),
      ),
      //backgroundColor: Colors.grey[300],


      body:

      Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 2, 10, 0),
            height: MediaQuery.of(context).size.height*0.05,
            //height: 125,
            color: Colors.blue,

            child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  Row(children: [

                    const Spacer(),

                  ]),

                  SizedBox(height: 12,),

                  Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Designa',
                          style: TextStyle(fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),),
                        const Spacer(),
                        Text('Charge',
                          style: TextStyle(fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),),
                        const Spacer(),
                        Text('Facture',
                          style: TextStyle(fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),),
                        const Spacer(),
                        Text('Resultat',
                          style: TextStyle(fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),),
                      ]),
                ]),

          ),

          Expanded(
            child: ListView.builder(
                itemCount: list_dossier_des_dossiers_cloture.length,
                itemBuilder: (context,index){
                  return Card(
                    child: ListTile(
                      onTap: (){},
                      title: Text(
                          list_dossier_des_dossiers_cloture[index].designation,
                      ),

                    ),
                  );
                }
            ),
          ),
        ],
      ),

    );
  }
}


