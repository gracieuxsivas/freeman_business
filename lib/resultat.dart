import 'package:flutter/material.dart';

class Resultat extends StatefulWidget {
  const Resultat({Key? key}) : super(key: key);

  @override
  State<Resultat> createState() => _ResultatState();
}

class _ResultatState extends State<Resultat> {
  @override
  Widget build(BuildContext context) {
    //final double height= MediaQuery.of(context).size.height;
    //final double width= MediaQuery.of(context).size.width;

    return Scaffold(
     appBar: AppBar(
       elevation: 0,
       title: const Text("TABLEAU DE RESULTAT PAR AN",
       style: TextStyle(
           fontSize:15,
           color: Colors.white,
           fontWeight: FontWeight.bold  ) ,),

       centerTitle: true
       ,


     ),

      backgroundColor: Colors.grey[300],

      body:

      Container(
        padding: EdgeInsets.fromLTRB(10, 7, 10, 0),
        height: 100,
        color: Colors.blue,



        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              // Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //   Icon(Icons.arrow_back,
              //     color: Colors.white,),
              //   //const Spacer(),
              //   Text('TABLEAU DE RESULTAT PAR AN ',
              //
              //     style: TextStyle(fontSize: 15,
              //         color: Colors.white,
              //         fontWeight: FontWeight.bold),
              //   ),
              //
              // ]),

              SizedBox(height: 5,),
              Container(
                padding: EdgeInsets.all(5),
                //margin: EdgeInsets.all(0),
                color: Colors.white,

                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisAlignment: MainAxisAlignment.end,

                    children: [
                      Text('Année : ',
                        style: TextStyle(fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),),

                      const Spacer(),

                      IconButton(onPressed: () {}, icon: Icon(Icons.calendar_month, size: 40,) )

                    ]
                ),
              ),

              //SizedBox(height: 8,),

              Row(

                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Mois',
                      style: TextStyle(fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),),
                    const Spacer(),
                    Text('Charge',
                      style: TextStyle(fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),),
                    const Spacer(),
                    Text('Produit',
                      style: TextStyle(fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),),
                    const Spacer(),
                    Text('Resultat',
                      style: TextStyle(fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),),
                  ]),


              // TextFormField(),
            ]),

      ),



//BOTTOM NAVIGATORBAR
//       bottomNavigationBaRr: BottomNavigationBar(
//         backgroundColor: Colors.blue,
//
//         //COULEUR POUR LES LABELS :
//
//         unselectedItemColor: Colors.white,
//         unselectedFontSize: 12,
//         fixedColor: Colors.white,
//
//         items: <BottomNavigationBarItem>[
//
//           BottomNavigationBarItem(
//             icon: SizedBox(),
//             label: "Total :",
//           ),
//
//           BottomNavigationBarItem(
//             icon: SizedBox(),
//             label: "Emails",
//           ),
//
//           BottomNavigationBarItem(
//             icon:  SizedBox(),
//             label: "Profile",
//           ),
//
//
//
//         ],
//
//
//       ),


      bottomNavigationBar: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),

          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Total :",
              style: TextStyle(fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),

        //TOTAL CHARGE
            Text("   ",
              style: TextStyle(fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),


            //TOTAL PRODUIT
            Text("   ",
              style: TextStyle(fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),

            //TOTAL Resultat
            Text("   ",
              style: TextStyle(fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),


            // IconButton(
            //   enableFeedback: false,
            //   onPressed: () {},
            //   icon: const Icon(
            //     Icons.work_outline_outlined,
            //     color: Colors.white,
            //     size: 30,
            //   ),
            // ),
            // IconButton(
            //   enableFeedback: false,
            //   onPressed: () {},
            //   icon: const Icon(
            //     Icons.widgets_outlined,
            //     color: Colors.white,
            //     size: 30,
            //   ),
            // ),
            // IconButton(
            //   enableFeedback: false,
            //   onPressed: () {},
            //   icon: const Icon(
            //     Icons.person_outline,
            //     color: Colors.white,
            //     size: 30,
            //   ),
            // ),
          ],
        ),
      ),

    );
  }
}
