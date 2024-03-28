import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:teamsyncia/models/reclamation.dart'; 
import '../addReclamation.dart';

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
                  return _buildFeedbackItem(feedback); 
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

  Widget _buildFeedbackItem(Reclamation feedback) {
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
                    feedback.title,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //SizedBox(height: 5.0),
                 // Text(feedback.description),
                ],
              ),
            ),
           
            
          ],
        ),
      ),
    );
  }

 

}