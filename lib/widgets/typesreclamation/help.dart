import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:teamsyncia/models/reclamation.dart';
import '../addReclamation.dart';

class HelpScreen extends StatefulWidget {
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  List<Reclamation> helpReclamations = [];

  Future<void> fetchHelpReclamations() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.56.1:48183/reclamation/type/support%20Requests'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        print("Received data: $data");

        setState(() {
          helpReclamations = data.map((item) => Reclamation(
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
    fetchHelpReclamations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: Center(
        child: helpReclamations.isEmpty
            ? Text('No reclamation found')
            : ListView.builder(
                itemCount: helpReclamations.length,
                itemBuilder: (context, index) {
                  final helpReclamation = helpReclamations[index];
                  return _buildHelpReclamationItem(helpReclamation); 
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

  Widget _buildHelpReclamationItem(Reclamation helpReclamation) {
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
                    helpReclamation.title,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            _buildStatusWidget(helpReclamation.status)
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
}
