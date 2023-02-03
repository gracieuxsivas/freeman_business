import 'package:flutter/material.dart';
import 'package:freeman_business/Models/Users.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();

}

class _LoginState extends State<Login> {

  bool isLoading = false;
  bool _validate = false;
  bool _validateUsername = false;
  bool _isHidden = true;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromRGBO(44, 44, 44, 0.6),
      body: Center (
        child : SingleChildScrollView(
         child: Padding (padding: EdgeInsets.all(10),
           child: Column(
             children: [
               // Container(
               //  padding: const EdgeInsets.all(10),

               // ElevatedButton(
               //   onPressed: () {},
               //   child: Icon(Icons.menu, color: Colors.white),
               //   style: ElevatedButton.styleFrom(
               //     shape: CircleBorder(),
               //     padding: EdgeInsets.all(20),
               //     //backgroundColor: Colors.blue, // <-- Button color
               //    // foregroundColor: Colors.red, // <-- Splash color
               //   ),
               // ),

               Image(image: AssetImage("images/logo.png"), height: 200, width: 200,),

               SizedBox(height: 80,), //<=== INTERLIGNE

               //PREMIERE ZONE DE SAISIE

               Card(
                 child: TextFormField(
                   controller: usernameController,
                   style: TextStyle (fontSize: 20) ,
                   decoration: InputDecoration(
                       contentPadding: EdgeInsets.all(10),
                     prefixIcon: Padding (padding: EdgeInsets.only(left: 20, right: 15),
                     child: Icon(Icons.person, size: 30,),
                     ),
                     labelText: "Login",
                     hintText: "Nom d'utilisaateur"
                   ),
                   keyboardType: TextInputType.text,
                 ),
               ),
               //___________________________________________


               //L'AUTRE ZONE DE SAISIE
               Card(
                 child: TextFormField(
                   controller: passwordController,
                   style: TextStyle (fontSize: 20) ,
                   obscureText: true,
                   decoration: InputDecoration(
                     contentPadding: EdgeInsets.all(10),
                       prefixIcon: Padding (padding: EdgeInsets.only(left: 20, right: 15),
                         child: Icon(Icons.phonelink_lock, size: 30,),
                       ),
                       labelText: "Mot de passe",
                       hintText: "Votre mot de passe"
                   ),
                   keyboardType: TextInputType.text,
                 ),
               ),

               //===============================================================
               //L'AUTRE CONTAINER DES BOUTONS

               Container(
                 padding: EdgeInsets.all(30),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     TextButton(
                       style: TextButton.styleFrom( ),

                         onPressed: (){}, child:
                              Text("Annulé", style:
                              TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold),)),

                     //BTN DE CONNECTION
                     SizedBox(
                       height: 44,
                       child: ElevatedButton(
                         style: ElevatedButton.styleFrom(
                           primary: Colors.lightBlueAccent,
                         ),
                         onPressed: (){
                           //Verifier si les champs de saisi ne sont pas vide

                           usernameController.text.isEmpty
                           ? _validateUsername = true
                               : _validateUsername = false;
                            passwordController.text.isEmpty
                            ? _validate = true
                                : _validate = false;
                            // isLoading=true;

                           if(usernameController.text.isNotEmpty &&
                               passwordController.text.isNotEmpty)
                             {
                                var username = usernameController.text;
                                var password = passwordController.text;

                                User.getConnexionUtilisateur(username, password)
                                  .then((data)
                                  {
                                    List<User> userdata = data;

                                    if(userdata.length > 0)
                                      {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content: Text("Connexion réussie avec succès"),
                                        ));

                                        //REDIRECTION VERS LA PAGE D'ACCEUIL
                                        Navigator.of(context).pushNamed("/accueil");
                                      }
                                    else
                                      {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content: Text("Echec de connexion"),
                                        ));
                                      }

                                  });

                             }


                       },
                         //color: Colors.lightBlueAccent,
                         child: Text(
                           "Connecté",
                           style: TextStyle(fontSize: 19, color: Colors.white),),
                       ),
                     )
                   ],
                 ),
               )

             ],
           ),
         ),
        )
      ),
    );
  }
}
