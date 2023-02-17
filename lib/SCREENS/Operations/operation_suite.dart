import 'package:flutter/material.dart';

//import 'model_list_file.dart';

class OperationSuite extends StatefulWidget {
  const OperationSuite({Key? key}) : super(key: key);

  @override
  State<OperationSuite> createState() => _OperationSuiteState();
}

class _OperationSuiteState extends State<OperationSuite> {



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

                    Text('PAYEMENT',
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

      backgroundColor: Colors.grey[200],

      body:
      Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
            //height: 50,
            //color: Colors.blue,


            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,


                children: [
                  Text("Caisse (debut ou entrée):",
                      style: TextStyle (fontSize: 17,
                          fontStyle: FontStyle.italic)),

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

                          // IconButton(onPressed: () {
                          //   //Navigator.pushNamed(context, '/nouveau_importateur');
                          // },
                          //     icon: Icon(Icons.search,
                          //         color: Colors.black,
                          //     )
                          // ),
                        ]),
                  ),

                ]),




          ),



          SizedBox(height: 12,),

          //Autre Mise en former

          Container(
            padding: EdgeInsets.fromLTRB(5, 4, 5, 0),



            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text("Import (Crédit):",
                    style: TextStyle (fontSize: 17,
                        fontStyle: FontStyle.italic)),
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
                          //Navigator.pushNamed(context, '/nouveau_importateur');
                        },
                            icon: Icon(Icons.search,
                              size: 40,
                              color: Colors.black,
                            )),
                      ]),
                ),
                Card(

                  child: TextFormField(
                    //controller: usernameController,
                    style: TextStyle (fontSize: 17) ,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        prefixIcon: Padding (padding: EdgeInsets.only(left: 20, right: 15),

                        ),
                        labelText: "Payement Global",
                        hintText: "  "
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12,),

          Container(
            padding: EdgeInsets.fromLTRB(5, 4, 5, 0),
            child:
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
                      //Navigator.pushNamed(context, '/nouveau_importateur');
                    },
                        icon: Icon(Icons.search,
                          size: 40,
                          color: Colors.black,
                        )),
                  ]),
            ),
          ),


         // SizedBox(height: 5,),

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
                    labelText: "Détails",
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
                    labelText: "Montant ",
                    hintText: "  "
                ),
                keyboardType: TextInputType.text,
              ),
            ),
          ),

          SizedBox(height: 40,),

          //OutlinedButton(onPressed: onPressed, child: child)

          OutlinedButton.icon(

          onPressed: (){
         // Navigator.pushNamed(context, '/recherche_du_compte');
          },
          style: OutlinedButton.styleFrom( backgroundColor: Colors.blue,
          //shape: StadiumBorder(),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          //side: BorderSide(width: 2, color: Colors.white),
          ),
          icon: Icon (Icons.add,size: 30,
          color: Colors.black,),
          label: Text("AJOUTER DETAILS",
          style: TextStyle(color: Colors.black,),
          ))









        ],
      ),
    );
  }
}








