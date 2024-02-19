import 'package:flutter/material.dart';
import 'package:project_dash/Screens/project3.dart';


class ProjectSecond extends StatefulWidget {
  const ProjectSecond ({Key? key});
  
  @override
  _ProjectSecond createState() => _ProjectSecond();
}
class _ProjectSecond extends State<ProjectSecond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Creating The Project'),
        backgroundColor: Color(0xFFE89F16), // Set app's primary color as the app bar's background color
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 10,),
                const Text('Project Leader',
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter project leader',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),

                    ),
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.0)),
                  ),
                ),
                const SizedBox(height: 30),
                const Text('Members (they must be friends )',
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter the members',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.0)),
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: 30),
                const Text(
                    'Tags',
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter words that describe the project',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.0)),
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: 170),
                ElevatedButton(onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProjectThird()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE89F16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  )
                ),
                  child: const Text(
                    'Create',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )


              ],
            ),
          ),
        ),
      ),
    );

  }
}