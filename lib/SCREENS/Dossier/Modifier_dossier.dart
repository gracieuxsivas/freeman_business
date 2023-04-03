import 'package:flutter/material.dart';

import 'model_list_file.dart';

class ModifierDossier extends StatefulWidget {
  const ModifierDossier({Key? key}) : super(key: key);

  @override
  State<ModifierDossier> createState() => _ModifierDossierState();
}

class _ModifierDossierState extends State<ModifierDossier> {



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

          SizedBox(height: 15,),



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








