
import 'package:teamsyncia/models/reclamation.dart';
import '../widgets/addReclamation.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'package:flutter/material.dart';



class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  List<Reclamation> feedbacks = [];

  Future<void> fetchFeedback() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.56.1:48183/reclamation/type/feedback'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        print("Received data: $data");

        setState(() {
          feedbacks = data.map((item) => Reclamation(
            title: item['title'] ?? '',
            status: item['status'] ?? '',
            description: item['description'] ?? '',
            date: DateTime.parse(item['date']),
            type: item['type'] ?? '',
          )).toList();
        });
      } else {
        print("Failed to load data: ${response.statusCode}");
        throw Exception('Failed to load data'); // Gestion des erreurs de chargement
      }
    } catch (e) {
      print("Network error: $e");
      throw Exception('Network error'); // Gestion des erreurs réseau
    }
  }

  @override
  void initState() {
    super.initState();
    fetchFeedback();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedbacks'),
      ),
      body: Center(
        child: feedbacks.isEmpty
            ? Text('No feedback found')
            : ListView.builder(
                itemCount: feedbacks.length,
                itemBuilder: (context, index) {
                  final feedback = feedbacks[index];
                  return ListTile(
                    title: Text(feedback.title),
                    subtitle: Text(feedback.status?.toString() ?? "Unknown"), // Handle null value
                    onTap: () {
                      // Gérer la suppression du feedback ici
                    },
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddReclamation()), // Replace with your AddReclamation screen
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.orange,
      ),
    );
  }
}
