import 'package:flutter/material.dart';
import 'package:freeman_business/Models/groupeCompte.dart';
import 'package:freeman_business/widgets/card_acceuil.dart';

class VoirEvolution extends StatefulWidget {
  const VoirEvolution({Key? key}) : super(key: key);

  @override
  State<VoirEvolution> createState() => _VoirEvolutionState();
}

class _VoirEvolutionState extends State<VoirEvolution> {

  double soldeCaisse =0,soldeBanque =0,soldeImporateur =0,soldeFournisseur = 0,sodleFraisDossier =0,facturImportateur=0;
  bool isLoading =false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      isLoading =  true;
    });
    GroupeCompte.getSoldeGroupeCompte(GroupeCompte.Banque).then((value) => setState(() {
      soldeBanque = value;
      isLoading =  false;
    }));
    //fournisseur
    GroupeCompte.getSoldeGroupeCompte(GroupeCompte.Fournisseur).then((value) => setState(() {
      soldeFournisseur = value;
      isLoading =  false;
    }));

    //caaisse
    GroupeCompte.getSoldeGroupeCompte(GroupeCompte.Caisse).then((value) => setState(() {
      soldeCaisse = value;
      isLoading =  false;
    }));

    //importateur
    GroupeCompte.getSoldeGroupeCompte(GroupeCompte.importateur).then((value) => setState(() {
      soldeImporateur = value;
      isLoading =  false;
    }));


     GroupeCompte.getFactureImportateur(2).then((value) => setState(() {
       facturImportateur = value;
      isLoading =  false;
    }));
     GroupeCompte.getFraisDossier(2).then((value) => setState(() {
       sodleFraisDossier = value;
      isLoading =  false;
    }));



  }


  @override
  Widget build(BuildContext context) {
    //final double height= MediaQuery.of(context).size.height;
    //final double width= MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.blue[700],
          title: Text("Evolution"),
          centerTitle: true,
          elevation: 0,
        ),

        body:

        Column(
          children: [
            Container(
              child: (
              OutlinedButton.icon(

                  onPressed: (){
                    Navigator.pushNamed(context, '/recherche_du_compte');
                  },
                  style: OutlinedButton.styleFrom( backgroundColor: Colors.white,
                    shape: StadiumBorder(),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    //side: BorderSide(width: 2, color: Colors.white),
                  ),
                  icon: Icon (Icons.keyboard_arrow_right,size: 30,
                              color: Colors.black,),
                  label: Text("Recherche du compte",
                              style: TextStyle(color: Colors.grey,),))
              ),

            ),
            isLoading?CircularProgressIndicator():Container(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(10),
                children: [

                  CardAcceuil(
                    titre: "Facturation importateur",
                    solde: "$facturImportateur \$",
                    icon: Icon(Icons.article, size: 40,),
                  ),

                  CardAcceuil(
                    titre: "Frais de dossier",
                    solde: "$sodleFraisDossier  \$",
                    icon: Icon(Icons.today, size: 40,),
                  ),



                  CardAcceuil(
                    titre: "Caisse (Sode)",
                    solde: "$soldeCaisse  \$",
                    icon: Icon(Icons.attach_money, size: 40,),
                  ),

                  CardAcceuil(
                    titre: "Banque (Sode)",
                    solde: "$soldeBanque \$",
                    icon: Icon(Icons.account_balance, size: 40,),
                  ),

                  CardAcceuil(
                    titre: "Importateur",
                    solde: "$soldeImporateur  \$",
                    icon: Icon(Icons.shopping_cart, size: 40,),
                  ),
                  CardAcceuil(
                    titre: "Fournisseur(Solde)",
                    solde: "$soldeFournisseur  \$",
                    icon: Icon(Icons.local_shipping, size: 40,),
                  ),


                  Container(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // FlatButton(onPressed: (){}, child:
                        // Text("Annulé", style:
                        // TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold),)),
                      ],
                    ),
                  )
                ],
              ),

            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,
              width: double.infinity,//<= Match parent
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                onPressed: (){},
                //color: Colors.blue[700],
                child: Text(
                  "VOIR LE GRAPHIQUE",
                  style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),),
              ),

            )
          ],
        ),
    );
  }
}
