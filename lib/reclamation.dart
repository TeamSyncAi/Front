import 'package:flutter/material.dart';
import 'ReclamationDetail.dart';

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