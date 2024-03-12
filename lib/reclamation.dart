import 'package:flutter/material.dart';
import 'typesreclamation/ideesuggestion.dart';
import 'typesreclamation/signalement.dart'; 
import 'typesreclamation/help.dart';     
import 'typesreclamation/gestiontaches.dart';  // Import for Gestion des tâches et des projets screen
import 'typesreclamation/feedback.dart';            // Import for Feedback screen
import 'typesreclamation/health.dart';                // Import for Santé screen (assuming a separate screen exists)

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
    Reclamation(type: 'Idea and suggestions'),
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
        title: Text('Reclamations'),
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
                    Widget targetScreen; 

                    switch (reclamations[index].type) {
                      case 'Idea and suggestions':
                        targetScreen = IdeeSuggestion(type: reclamations[index].type);
                        break;
                      case 'Signalement des problèmes':
                        targetScreen = Signalement(type: reclamations[index].type); 
                        break;
                      case 'Demande de support':
                        targetScreen = help(type: reclamations[index].type); 
                         break;
                      case 'Gestion des tâches et des projets':
                        targetScreen = GestionTaches(type: reclamations[index].type); 
                         break;
                      case 'Feedback':
                        targetScreen = Feedback(type: reclamations[index].type); 
                          break;
                      case 'Santé':
                        targetScreen = health(type: reclamations[index].type); 
                         break;
                      default:
                        print('Unhandled reclamation type: ${reclamations[index].type}');
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => targetScreen),
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
