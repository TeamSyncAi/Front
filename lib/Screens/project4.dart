import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../charts/radialP.dart';

class ProjectFourth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Project Dashboard'),
        backgroundColor: Color(0xFFE89F16),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 10),
              _buildCompletionStatus(),
              SizedBox(height: 10),
              SizedBox(height: 10),
              _buildCharts(),
              SizedBox(height: 10),
              _buildModuleCompletionList(),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildCompletionStatus() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'StuStay',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFE89F16)),
            ),
            SizedBox(height: 15),
            SizedBox(
              height: 190,
              child: CustomPaint(
                painter: RadialPainter(
                  bgColor: Color(0xFF8D6322),
                  lineColor: Colors.orange,
                  percent: 60 / 100, // Adjust percentage as needed
                  width: 15.0, // Adjust thickness as needed
                ),
                child: Center(
                  child: Text(
                    '60%',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildCompletionLegend('60% done', Colors.orange),
                SizedBox(width: 30),
                _buildCompletionLegend('40% not done', Color(0xFF8D6322)),
              ],
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildCompletionLegend(String text, Color color) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildModuleCompletionList() {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        _buildModuleCompletion('Module 1', 20, Colors.red),
        _buildModuleCompletion('Module 2', 10, Colors.blue),
        _buildModuleCompletion('Module 3', 15, Colors.green),
        _buildModuleCompletion('Module 4', 25, Colors.orange),
        _buildModuleCompletion('Module 5', 12, Colors.purple),
        _buildModuleCompletion('Module 6', 18, Colors.yellow),
      ],
    );
  }

  Widget _buildModuleCompletion(String title, int percentage, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 20),
            Expanded(
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
      ),
    );
  }

  Widget _buildCharts() {
    return Column(
      children: [
        _buildModuleHoursChart(),
        SizedBox(height: 20),
        _buildTaskStatusChart(),
        SizedBox(height: 10),

      ],
    );
  }

  Widget _buildModuleHoursChart() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Module Hours (Hours per Day)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFE89F16)),
            ),
            SizedBox(height: 10),
            Container(
              height: 300,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 3),
                        FlSpot(1, 4),
                        FlSpot(2, 3),
                        FlSpot(3, 5),
                        FlSpot(4, 4),
                        FlSpot(5, 6),
                        FlSpot(6, 4),
                      ],
                      isCurved: true,
                      colors: [Color(0xFFE89F16)],
                      barWidth: 3,
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(show: false),
                    ),
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 2),
                        FlSpot(1, 3),
                        FlSpot(2, 2),
                        FlSpot(3, 4),
                        FlSpot(4, 3),
                        FlSpot(5, 5),
                        FlSpot(6, 3),
                      ],
                      isCurved: true,
                      colors: [Colors.blue],
                      barWidth: 3,
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(show: false),
                    ),
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 2),
                        FlSpot(1, 4),
                        FlSpot(2, 1),
                        FlSpot(3, 3),
                        FlSpot(4, 4),
                        FlSpot(5, 2),
                        FlSpot(6, 5),
                      ],
                      isCurved: true,
                      colors: [Colors.red],
                      barWidth: 3,
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                  titlesData: FlTitlesData(
                    leftTitles: SideTitles(showTitles: true),
                    bottomTitles: SideTitles(showTitles: true),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskStatusChart() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Task Status',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFE89F16)),
            ),
            Stack(
              children: [
                Center(
                  child: SizedBox(
                    height: 250, // Adjust height of the PieChart
                    width: 250, // Adjust width of the PieChart
                    child: PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(
                            value: 60,
                            color: Colors.green,
                            title: '60%',
                            radius: 100, // Adjust radius of the PieChart section
                          ),
                          PieChartSectionData(
                            value: 25,
                            color: Colors.red,
                            title: '25%',
                            radius: 100, // Adjust radius of the PieChart section
                          ),
                          PieChartSectionData(
                            value: 15,
                            color: Colors.yellow,
                            title: '15%',
                            radius: 100, // Adjust radius of the PieChart section
                          ),
                        ],
                        centerSpaceRadius: 0,
                        sectionsSpace: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildLegendItem(color: Colors.green, text: 'done'),
                      SizedBox(width: 20),
                      _buildLegendItem(color: Colors.red, text: 'not done'),
                      SizedBox(width: 20),
                      _buildLegendItem(color: Colors.yellow, text: 'pending'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildLegendItem({required Color color, required String text}) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        SizedBox(width: 20),
        Text(
          text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

}
