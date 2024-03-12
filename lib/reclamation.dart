import 'package:flutter/material.dart';
import 'package:teamsyncia/ideesuggestion.dart';
import 'IdeeSuggestion.dart';

class Reclamation {
  String type;
  int count;

  Reclamation({required this.type, this.count = 0});
}

class ReclamationScreen extends StatefulWidget {
  @override
  _ReclamationScreenState createState() => _ReclamationScreenState();
}

class _ReclamationScreenState extends State<ReclamationScreen> {
  List<Reclamation> reclamations = [
    Reclamation(type: 'Idées et suggestions'),
    Reclamation(type: 'Signalement des problèmes'),
    Reclamation(type: 'Demande de support'),
    Reclamation(type: 'Gestion des tâches et des projets'),
    Reclamation(type: 'Feedback'),
    Reclamation(type: 'Santé'),
  ];
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Réclamations'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Rechercher',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.orange[100],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: reclamations.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => IdeeSuggestion(type: reclamations[index].type),
                      ),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.orange, width: 2.0),
                    ),
                    child: ListTile(
                      title: Text(reclamations[index].type),
                      trailing: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Text(reclamations[index].count.toString()),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}