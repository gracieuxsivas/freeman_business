import 'package:flutter/material.dart';

class RechercheDuCompte extends StatefulWidget {
  const RechercheDuCompte({Key? key}) : super(key: key);

  @override
  State<RechercheDuCompte> createState() => _RechercheDuCompteState();
}

class _RechercheDuCompteState extends State<RechercheDuCompte> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Text("Recherche du compte"),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(onPressed: (){
            showSearch(
                context: context,
                delegate: CustomSearchDelegate(),);
          }, icon: const Icon(Icons.search))
        ],
      ),

    );
  }
}

class CustomSearchDelegate extends SearchDelegate{
  List<String> SearchTerms= [
    //LISTE DES DONNER DANS LA CASE DE RECHERCHE

    'Tokyo',
    'Rio',
    'LosAngeless',
    'Rome',
    'London'
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {

    return[
      IconButton(onPressed: () {
        query= '';
      }, icon: Icon(Icons.clear))
    ];
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {

    return IconButton(onPressed: (){
      close (context, null);
    }, icon: Icon(Icons.arrow_back)
    );

    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery =[];
    for (var contries in SearchTerms) {
      if (contries.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(contries);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
        itemBuilder: (text, index) {
      var result= matchQuery[index];
      return ListTile(
        title: Text(result),
      );


    },
    );
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery =[];
    for (var contries in SearchTerms) {
      if (contries.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(contries);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (text, index) {
        var result= matchQuery[index];
        return ListTile(
          title: Text(result),
        );

      },
    );
    throw UnimplementedError();
  }
}









