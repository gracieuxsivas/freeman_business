import 'package:flutter/material.dart';

import 'model_list_file.dart';

class AjouterDossier extends StatefulWidget {
  const AjouterDossier({Key? key}) : super(key: key);

  @override
  State<AjouterDossier> createState() => _AjouterDossierState();
}

class _AjouterDossierState extends State<AjouterDossier> {



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
                //controller: usernameController,
                style: TextStyle (fontSize: 17) ,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    prefixIcon: Padding (padding: EdgeInsets.only(left: 20, right: 15),

                    ),
                    labelText: "Numero Plaque",
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
                    labelText: "Numero D??claration",
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
                    labelText: "Autre Num??ro",
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
                //controller: usernameController,
                style: TextStyle (fontSize: 17) ,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    prefixIcon: Padding (padding: EdgeInsets.only(left: 20, right: 15),

                    ),
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
                //controller: usernameController,
                style: TextStyle (fontSize: 17) ,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    prefixIcon: Padding (padding: EdgeInsets.only(left: 20, right: 15),

                    ),
                    labelText: "Commentaire ",
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








