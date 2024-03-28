import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:teamsyncia/models/reclamation.dart'; 
import '/widgets/addReclamation.dart';
import 'package:teamsyncia/widgets/filterDialog.dart';
class IdeeSuggestionScreen extends StatefulWidget {
  @override
  _IdeeSuggestionScreenState createState() => _IdeeSuggestionScreenState();
}

class _IdeeSuggestionScreenState extends State<IdeeSuggestionScreen> {
  List<Reclamation> ideeSuggestions = [];

  Future<void> fetchIdeeSuggestions() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.56.1:48183/reclamation/type/ideas%20and%20suggestions'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        print("Received data: $data");

        setState(() {
          ideeSuggestions = data.map((item) => Reclamation(
            title: item['title'] ?? '',
            status: item['status'] ?? '',
            description: item['description'] ?? '',
            date: DateTime.parse(item['date']),
            type: item['type'] ?? '',
          )).toList();
        });
      } else {
        print("Failed to load data: ${response.statusCode}");
        throw Exception('Failed to load data'); 
      }
    } catch (e) {
      print("Network error: $e");
      throw Exception('Network error'); 
    }
  }

  @override
  void initState() {
    super.initState();
    fetchIdeeSuggestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ideas and suggestions',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              _showFilterDialog(context);
            },
          ),
        ],
      ),
      body: Center(
        child: ideeSuggestions.isEmpty
            ? Text('No reclamation found')
            : ListView.builder(
                itemCount: ideeSuggestions.length,
                itemBuilder: (context, index) {
                  final ideeSuggestion = ideeSuggestions[index];
                  return _buildIdeeSuggestionItem(ideeSuggestion); 
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddReclamation()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 241, 241, 241),
      ),
    );
  }

  Widget _buildIdeeSuggestionItem(Reclamation ideeSuggestion) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.0),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ideeSuggestion.title,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            _buildStatusWidget(ideeSuggestion.status)
          ],
        ),
      ),
    );
  }

  Widget _buildStatusWidget(String status) {
    Color backgroundColor;
    switch (status.toLowerCase()) {
      case 'in progress':
        backgroundColor = Colors.orange;
        break;
      case 'accepted':
        backgroundColor = Colors.green;
        break;
      case 'rejected':
        backgroundColor = Colors.red;
        break;
      default:
        backgroundColor = Colors.grey;
    }

    return Row(
      children: [
        Container(
          width: 20.0,
          height: 20.0,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        SizedBox(width: 5.0),
        Text(status),
      ],
    );
  }

  _showFilterDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return FilterDialog(
        onFilter: (String? status, DateTime? date, String? project) {
          // Copiez la liste d'idées suggestions dans une liste temporaire pour filtrer
          List<Reclamation> filteredList = List.from(ideeSuggestions);

          // Filtrer par statut
          if (status != null) {
            filteredList = filteredList.where((reclamation) => reclamation.status == status).toList();
          }

          // Filtrer par date
          if (date != null) {
            filteredList = filteredList.where((reclamation) => reclamation.date.year == date.year && reclamation.date.month == date.month && reclamation.date.day == date.day).toList();
          }

          // Filtrer par projet
          if (project != null) {
           // filteredList = filteredList.where((reclamation) => reclamation.project == project).toList();
          }

          // Mettre à jour la liste d'idées suggestions affichée
          setState(() {
            ideeSuggestions = filteredList;
          });

          // Fermer le dialogue
          Navigator.of(context).pop();
        },
      );
    },
  );
}

}
