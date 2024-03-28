import 'package:flutter/material.dart';
import 'package:teamsyncia/widgets/typesreclamation/managment.dart';
import 'typesreclamation/ideesuggestion.dart';
import 'typesreclamation/signalement.dart';
import 'typesreclamation/help.dart';
import 'typesreclamation/gestiontaches.dart';
import 'typesreclamation/health.dart';
import 'typesreclamation/feedback.dart';

class Reclamation {
  String type;
  int count;

  Reclamation({required this.type, required this.count});
}

class ReclamationState {
  final List<Reclamation> reclamations;

  ReclamationState(this.reclamations);

  ReclamationState copyWith({
    List<Reclamation>? reclamations,
  }) {
    return ReclamationState(reclamations ?? this.reclamations);
  }
}

class ReclamationScreen extends StatefulWidget {
  @override
  _ReclamationScreenState createState() => _ReclamationScreenState();
}

class _ReclamationScreenState extends State<ReclamationScreen> {
  ReclamationState state = ReclamationState([
    Reclamation(type: 'Ideas and suggestions', count: 0),
    Reclamation(type: 'Reporting problems', count: 0),
    Reclamation(type: 'Support Requests', count: 0),
    Reclamation(type: 'Task and project management', count: 0),
    Reclamation(type: 'Feedback', count: 0), // Initial count for feedback
    Reclamation(type: 'Health', count: 0),
  ]);

  // ValueNotifier for feedback count
  final feedbackCount = ValueNotifier<int>(0);

  // Example function to update count (replace with your actual data fetching)
  void updateCount(String type, int newCount) {
    if (type.toLowerCase() == 'feedback') {
      feedbackCount.value = newCount;
    } else {
      setState(() {
        state = state.copyWith(
          reclamations: state.reclamations
              .map((reclamation) => reclamation.type.toLowerCase() == type.toLowerCase()
                  ? Reclamation(type: type, count: newCount)
                  : reclamation)
              .toList(),
        );
      });
    }
  }

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
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color.fromARGB(206, 252, 252, 252),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: state.reclamations.length,
              itemBuilder: (context, index) {
                final reclamation = state.reclamations[index];
                return GestureDetector(
                  onTap: () {
                    Widget targetScreen = Container();
                    switch (reclamation.type) {
                      case 'Ideas and suggestions':
                          targetScreen = IdeeSuggestionScreen();
                         break;
                      case 'Reporting problems':
                        targetScreen =SignalementScreen();
                        break;
                      case 'Support Requests':
                        targetScreen = HelpScreen();
                        break;
                      case 'Task and project management':
                        targetScreen = ManagementScreen();
                        break;
                      case 'Feedback':
                        targetScreen = FeedbackScreen();
                        break;
                      case 'Health':
                        targetScreen = HealthScreen();
                        break;
                      default:
                        print('Unhandled reclamation type: ${reclamation.type}');
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
                      title: Text(reclamation.type),
                      trailing: reclamation.type.toLowerCase() == 'feedback'
                          ? ValueListenableBuilder<int>(
                              valueListenable: feedbackCount,
                              builder: (context, count, _) => CircleAvatar(
                                backgroundColor: Colors.white,
                              child: Text(count.toString()),
                            ),
                          )
                          : CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Text(reclamation.count.toString()),
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
