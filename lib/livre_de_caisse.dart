import 'package:flutter/material.dart';

class Livre_de_caisse extends StatefulWidget {
  const Livre_de_caisse({Key? key}) : super(key: key);

  @override
  State<Livre_de_caisse> createState() => _Livre_de_caisse();
}

class _Livre_de_caisse extends State<Livre_de_caisse> {
  @override
  Widget build(BuildContext context) {
    //final double height= MediaQuery.of(context).size.height;
    //final double width= MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        centerTitle: true,
        toolbarHeight: 50,
        title:
        Column(

            crossAxisAlignment: CrossAxisAlignment.end,

            children: [
              Row(children: [
                //Icon(Icons.arrow_back),
                Text('LIVRE DE CAISSE',
                  style: TextStyle(fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(onPressed: () {},
                    icon: Icon(Icons.search,
                        color: Colors.white)),

              ]),
              
            ]),
      ),
      backgroundColor: Colors.grey[300],

      body:

      Container(
        padding: EdgeInsets.fromLTRB(10, 4, 10, 0),
        height: 40,
        color: Colors.blue,


        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [


              Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Designation',
                      style: TextStyle(fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),),
                    const Spacer(),
                    Text('Compte',
                      style: TextStyle(fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),),
                    const Spacer(),
                    Text('Solde',
                      style: TextStyle(fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),),
                  ]),

              // TextFormField(),
            ]),
      ),



      // Column(
      //   children: [
      //     Container(
      //       child:
      //       ListView(
      //
      //       ),
      //     )
      //   ],
      // ),


    );
  }
}
