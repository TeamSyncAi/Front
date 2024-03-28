import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddReclamation extends StatefulWidget {
  @override
  _AddReclamationState createState() => _AddReclamationState();
}

class _AddReclamationState extends State<AddReclamation> {
  final _formKey = GlobalKey<FormState>();
  final _titreController = TextEditingController();
  final _descriptionController = TextEditingController();

  final _backendUrl = 'http://192.168.56.1:48183/reclamation'; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Reclamation'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _titreController,
                decoration: InputDecoration(labelText: 'Type'),
                validator: (value) {
                  
                  return null;
                },
              ),
              TextFormField(
                controller: _titreController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      final response = await http.post(
                        Uri.parse(_backendUrl),
                        body: jsonEncode({
                          'titre': _titreController.text,
                          'description': _descriptionController.text,
                        }),
                        headers: {'Content-Type': 'application/json'},
                      );

                      if (response.statusCode == 201) {
                        print('Reclamation added successfully');
                        Navigator.pop(context); 
                      } else {
                        print('Error adding reclamation: ${response.statusCode}');
                      }
                    } catch (error) {
                      print('Error: $error');
                    }
                  }
                },
                child: Text('Send complaint'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
