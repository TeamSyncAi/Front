import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:teamsyncia/models/reclamation.dart';
import '../addReclamation.dart';

class SignalementScreen extends StatefulWidget {
  @override
  _SignalementState createState() => _SignalementState();
}

  

class _SignalementState extends State<SignalementScreen> {
  List<Reclamation> signalements = [];

  Future<void> fetchSignalements() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.56.1:48183/reclamation/type/reporting%20problems'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        print("Received data: $data");

        setState(() {
          signalements = data.map((item) => Reclamation(
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
    fetchSignalements();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reporting problems'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
                  SizedBox(height: 8.0),
                  if (signalements.isEmpty)
                    Text('No reclamation found')
                  else
                    Column(
                      children: signalements.map((reclamation) => _buildReclamationItem(reclamation)).toList(),
                    ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddReclamation()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              child: Text(
                'Add ',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReclamationItem(Reclamation reclamation) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.0),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            reclamation.title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            reclamation.description,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 8.0),
          _buildStatusWidget(reclamation.status),
        ],
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
        CircleAvatar(
          backgroundColor: backgroundColor,
          radius: 8.0,
        ),
        SizedBox(width: 8.0),
        Text(
          status,
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }
}
