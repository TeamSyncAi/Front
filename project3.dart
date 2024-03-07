import 'package:flutter/material.dart';
import 'package:project_dash/Screens/project4.dart';
import 'package:project_dash/Screens/project5.dart';
import '../apiService/api_service.dart';
import '../models/module.dart';


class ProjectThird extends StatefulWidget {
  final String projectId;
  final String projectName;
  final String teamLeader;
  final List<String> members;
  final List<String> keywords;
  final DateTime startDate;
  final DateTime endDate;

  const ProjectThird({
    Key? key,
    required this.projectId,
    required this.projectName,
    required this.teamLeader,
    required this.members,
    required this.keywords,
    required this.startDate,
    required this.endDate,
  }) : super(key: key);

  @override
  _ProjectThirdState createState() => _ProjectThirdState();
}

class _ProjectThirdState extends State<ProjectThird> {
  late List<Module> modules = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchModules();
  }

  Future<void> fetchModules() async {
    setState(() {
      isLoading = true;
    });
    try {
      print('Fetching modules for project ID: ${widget.projectId}');
      List<Module> fetchedModules =
      await ApiService.fetchModules(widget.projectId);
      print('Fetched modules: $fetchedModules');

      setState(() {
        modules = fetchedModules;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching modules: $e');
      setState(() {
        isLoading = false;
      });
      // You can show a snackbar or a dialog to notify the user about the error.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Details'),
        backgroundColor: const Color(0xFFE89F16),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Name and Leader
            Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Name : ${widget.projectName}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Leader : ${widget.teamLeader}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : modules.isEmpty
                  ? Center(child: Text('No modules found'))
                  : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Start and End Time
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Start time",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "${widget.startDate.day}-${widget.startDate.month}-${widget.startDate.year}",
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                "End time",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "${widget.endDate.day}-${widget.endDate.month}-${widget.endDate.year}",
                              ),
                            ],
                          )
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1.0,
                        height: 20,
                        indent: 5,
                        endIndent: 5,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Modules",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Display modules
                      Column(
                        children: modules.map((module) {
                          return SizedBox(
                            width: double.infinity, // Adjust width as needed
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProjectFifth(moduleId: module.module_id),
                                  ),
                                );
                              },
                              child: Card(
                                elevation: 3,
                                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    module.module_name,
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center, // Center text horizontally
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProjectFourth()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE89F16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                child: const Text("OK", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
