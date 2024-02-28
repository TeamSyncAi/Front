import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.blue, // Change as needed
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello !\nAloulou',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              _buildTaskCard(context),
              SizedBox(height: 20.0),
              Text(
                'In Progress',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              _buildInProgressTask(context, 'Design Project', 100),
              _buildInProgressTask(context, 'StuStay Project', 100),
              SizedBox(height: 20.0),
              Text(
                'Module',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              _buildModuleTask(context, 'Module User', 23, 60),
              _buildModuleTask(context, 'Module Reclamation', 16, 52),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTaskCard(BuildContext context) {
    return Card(
      color: Colors.yellow,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your today\'s task\nalmost done!',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to tasks
                    },
                    child: Text('View Tasks'),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10.0),
            _buildCircularProgressIndicator(70), // Pass the progress value here
          ],
        ),
      ),
    );
  }

  Widget _buildInProgressTask(BuildContext context, String title, double completion) {
    return Card(
      color: Colors.yellow,
      child: ListTile(
        title: Text(title),
        subtitle: LinearProgressIndicator(value: completion / 100),
        trailing: Text('${completion.toInt()}%'),
      ),
    );
  }

  Widget _buildModuleTask(BuildContext context, String moduleName, int taskCount, double completion) {
    return ListTile(
      leading: Icon(Icons.check_circle_outline), // Change icons as needed
      title: Text(moduleName),
      subtitle: Text('$taskCount Tasks'),
      trailing: _buildCircularProgressIndicator(completion),
    );
  }

  Widget _buildCircularProgressIndicator(double completion) {
    return SizedBox(
      height: 50.0,
      width: 50.0,
      child: CircularProgressIndicator(
        value: completion / 100,
        backgroundColor: Colors.grey,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue), // Change as needed
      ),
    );
  }
}
