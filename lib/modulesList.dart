// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ListTileModule extends StatelessWidget {
  final String title;
  final String description;
  final List<String> profileImagePaths;
  final int percentage;
  final String imagePath; 
  final VoidCallback onTap;// New property for image asset path

  const ListTileModule({
    Key? key,
    required this.title,
    required this.description,
    required this.profileImagePaths,
    required this.percentage,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 40),
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 10),
                      child: Text(
                        description,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ]),
            ),
            // Title, Description, Icon, and Percentage
            Container(
              height: 100,
              padding: const EdgeInsets.all(10.0),
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: List.generate(
                          profileImagePaths.length,
                          (index) => Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: CircleAvatar(
                              radius: 15.0,
                              backgroundImage:
                                  AssetImage(profileImagePaths[index]),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '$percentage%', // Sum of all percentages
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Integrated Pie Chart
                  LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width - 80,
                    lineHeight: 15.0,
                    percent: percentage / 100,
                    backgroundColor: const Color.fromARGB(255, 238, 225, 225),
                    progressColor: Colors.orange,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
