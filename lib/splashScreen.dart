import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freeman_business/utilits/CheckConnexion.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SharedPreferences? _prefs;

  Future<void> initializePreference() async {
    this._prefs = await SharedPreferences.getInstance();

    timeToShowSplashScreenOnScreen();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializePreference();
  }

  void timeToShowSplashScreenOnScreen() async {
    // print("Justin Fumbo");
    //syncronisations des donnees
    Timer(const Duration(seconds: 2), () async {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      bool isLoggedIn = _prefs.getBool("loggedIn")??false;
      // String? user = _prefs.getString("currentUsers");
      // print(user);

      //verification internet
      CheckConnexion.isConnexionAvailable().then((value){
        print(value);
        if(value == "true"){
          if (isLoggedIn) {
            Navigator.of(context).pushReplacementNamed("/accueil");
          } else {
            Navigator.of(context).pushReplacementNamed("/login");
          }
        }else{
          //Navigator.of(context).pushReplacementNamed(NonInternetAvaliable.routeName);
        }
      });


    });
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:Center(
        child:Image(image: AssetImage("images/logo.png"), height: 200, width: 200,),

      ),
    );
  }
}
