import 'package:flutter/material.dart';

class Balance extends StatefulWidget {
  const Balance({Key? key}) : super(key: key);

  @override
  State<Balance> createState() => _BalanceState();
}

class _BalanceState extends State<Balance> {
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
                Text('GROUPE DE BALANCE',
                  style: TextStyle(fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(onPressed: () {},
                    icon: Icon(Icons.search,
                        color: Colors.white)),

              ]),

              //SizedBox(height: 10,),


            ]),
      ),
      backgroundColor: Colors.grey[300],

      body:

      Container(
        padding: EdgeInsets.fromLTRB(10, 4, 10, 0),
       // padding: EdgeInsets.fromLTRB(10, 35, 10, 0),
        height: 40,
        //height: 125,
        color: Colors.blue,


    //     decoration: BoxDecoration(
    //     borderRadius: BorderRadius.only(
    //     bottomRight: Radius.circular(0),
    // ),
    // color: Colors.blue,
    //         boxShadow: [
    //           new BoxShadow(
    //             //________________
    //             //Reglage OPACITE/
    //             //_______________
    //
    //               color: Colors.blue.withOpacity(0.3),
    //               offset: new Offset(-10.0, 0.0),
    //               blurRadius: 20.0,
    //               spreadRadius: 4.0),
    //         ]
    //     ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              // Row(children: [
              //   Icon(Icons.arrow_back,
              //   color: Colors.white,),
              //   const Spacer(),
              //   Text('GROUPE DE BALANCE',
              //     style: TextStyle(fontSize: 15,
              //     color: Colors.white,
              //         fontWeight: FontWeight.bold),
              //   ),
              //   const Spacer(),
              //   IconButton(onPressed: () {},
              //       icon: Icon(Icons.search,
              //           color: Colors.white)),
              //   //Icon(Icons.search),
              //
              // ]),

              SizedBox(height: 12,),

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
