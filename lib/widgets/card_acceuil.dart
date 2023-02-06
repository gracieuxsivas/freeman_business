import 'package:flutter/material.dart';


class CardAcceuil extends StatelessWidget {
  String titre,solde;
  Icon icon;
  CardAcceuil({Key? key,required this.titre,required this.solde,required this.icon}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return    Card(
      elevation: 15,
      shadowColor: Colors.blue,
      child:
      // Padding(padding: EdgeInsets.all(10)),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("$titre",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )
            ),
            Divider(height: 10.0,
              color: Colors.grey[700],),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween ,
              children: [
                Text("$solde",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                    fontSize:14,
                  ),),
                const SizedBox(width:10 ,),
                icon,
              ],
            )
          ],
        ),
      ),

    );
  }
}
