import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //String dropdownvalue = 'Apple';
 // var items =  ['Apple','Banana','Grapes','Orange','watermelon','Pineapple'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Focussed Menu"),
      ),

      backgroundColor: Colors.grey[900],
      body: Container(

        child: Padding(
        padding: EdgeInsets.all(15),
          child: //StaggeredGridView.countBuild
          Column (
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Focused Popup')
                ],
              ),
              Expanded(
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    children: [1, 2, 3, 4, 5, 6, 7, 8,9,10,11,12].map((e) => 
                        FocusedMenuHolder(
                          //Brur =Filgrane(surbrillance)
                          menuWidth: MediaQuery.of(context).size.width*0.5,//<= prendre la moitier de la largeur ecran
                          menuItemExtent: 50, //<Pour la hauteur
                          animateMenuItems: false,
                          duration: Duration(microseconds: 500 ),
                          menuBoxDecoration: BoxDecoration(color: Colors.blue),
                          blurSize: 4,
                          blurBackgroundColor: Colors.white,
                          onPressed: (){},
                          menuItems: <FocusedMenuItem>[
                            FocusedMenuItem(title: Text("Dossier Envoye "), onPressed: (){}, trailingIcon: Icon(Icons.add)),
                            FocusedMenuItem(title: Text("Dossier recu "), onPressed: (){}, trailingIcon: Icon(Icons.share), backgroundColor: Colors.redAccent),
                          ],
                          child: Card(
                      child: Image.asset("images/logo.png") ,),
                        ) ).toList(),
                    

                  ))
            ],

          ),
        ),
      ),
    );
  }
}