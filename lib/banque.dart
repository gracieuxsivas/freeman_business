import 'package:flutter/material.dart';

class Banque extends StatefulWidget {
  const Banque({Key? key}) : super(key: key);

  @override
  State<Banque> createState() => _BanqueState();
}

class _BanqueState extends State<Banque> {
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
                Text('BANQUE',
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
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        height: 40,
        color: Colors.blue,


               child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              // Row(children: [
              //   Icon(Icons.arrow_back,
              //     color: Colors.white,),
              //   const Spacer(),
              //   Text('BANQUE',
              //     style: TextStyle(fontSize: 15,
              //         color: Colors.white,
              //         fontWeight: FontWeight.bold),
              //   ),
              //   const Spacer(),
              //   IconButton(onPressed: () {},
              //       icon: Icon(Icons.search,
              //           color: Colors.white)),
              //   //Icon(Icons.search),
              //
              // ]),
              //
              // SizedBox(height: 12,),

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
