import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ProjectFourth extends StatefulWidget {
  const ProjectFourth({Key? key}) : super(key: key);

  @override
  _ProjectFourthState createState() => _ProjectFourthState();
}

class _ProjectFourthState extends State<ProjectFourth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Project Dashboard'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Completion Status',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color(0xFFE89F16)),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'StuStay',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Color(0xFFE89F16)),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: PieChart(
                              PieChartData(
                                sections: [
                                  PieChartSectionData(
                                    value: 60,
                                    color: Colors.orange,
                                  ),
                                  PieChartSectionData(
                                    value: 40,
                                    color: Colors.deepOrange,
                                  ),
                                ],
                                centerSpaceRadius: 50,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                color: Colors.orange,
                              ),
                              SizedBox(width: 5),
                              Text('60% done'),
                              SizedBox(width: 20),
                              Container(
                                width: 20,
                                height: 20,
                                color: Colors.deepOrange,
                              ),
                              SizedBox(width: 5),
                              Text('40% not done'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Members(30)/Module',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color(0xFFE89F16)),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildModuleCompletion('Module 1', 20, Colors.red),
                    _buildModuleCompletion('Module 2', 10, Colors.blue),
                    _buildModuleCompletion('Module 3', 15, Colors.green),
                    _buildModuleCompletion('Module 4', 25, Colors.orange),
                    _buildModuleCompletion('Module 5', 12, Colors.purple),
                    _buildModuleCompletion('Module 6', 18, Colors.yellow),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModuleCompletion(String title, int percentage, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 2,
            child: LinearProgressIndicator(
              value: percentage / 100,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
          SizedBox(width: 10),
          Text(
            '$percentage%',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
