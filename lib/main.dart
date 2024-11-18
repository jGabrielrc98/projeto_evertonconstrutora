import 'package:flutter/material.dart';
import 'componets/novbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Everton Silva Construtora',
      theme: ThemeData(
        primaryColor: Colors.blue[700],
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top Navbar
            ResponsiveNavbar(),

            // Hero Section
            Container(
              height: 700,
              color: Colors.black,
              child: Stack(
                children: [
                  Image.network(
                    'https://via.placeholder.com/600x300', // Coloque a URL da imagem aqui
                    height: 500,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    left: 20,
                    top: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'PROVERB CONSTRUCTION',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                        Text(
                          'QUALITY. INTEGRITY.',
                          style: TextStyle(
                              color: Colors.yellow[700],
                              fontSize: 36,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('LEARN MORE'),
                            ),
                            SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.yellow[700]),
                              child: Text('FREE ONLINE ESTIMATE'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // About Us Section
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ABOUT US',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow[700]),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Proverb Construction builds commercial projects with a special focus on Storage Facility projects.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('LEARN MORE'),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  ),
                ],
              ),
            ),

            // Services Section
            Container(
              color: Colors.grey[200],
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ServiceCard(
                          icon: Icons.apartment, label: 'OFFICE BUILDING'),
                      ServiceCard(icon: Icons.build, label: 'CRANES'),
                      ServiceCard(icon: Icons.agriculture, label: 'BULLDOZER'),
                      ServiceCard(
                          icon: Icons.construction, label: 'HEAVY EQUIPMENT'),
                    ],
                  ),
                ],
              ),
            ),

            // Projects Section
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'OUR PROJECTS',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(4, (index) {
                      return ProjectCard(
                        imageUrl: 'https://via.placeholder.com/150',
                        projectName: 'Project ${index + 1}',
                      );
                    }),
                  ),
                ],
              ),
            ),

            // Why Choose Us Section
            Container(
              color: Colors.black,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'WHY CHOOSE US?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                          child: Text('Lorem ipsum dolor sit amet...',
                              style: TextStyle(color: Colors.white))),
                      SizedBox(width: 20),
                      Container(
                        color: Colors.yellow[700],
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text(
                              'FREE ESTIMATE',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                                'Contact us for a free estimate on your project.',
                                style: TextStyle(color: Colors.black)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Footer
            Container(
              color: Colors.black,
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    'CONTACT US',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '12345 State Highway 6 South, College Station, TX 77845',
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 5),
                  Text('(123) 456-7890',
                      style: TextStyle(color: Colors.white70)),
                  SizedBox(height: 5),
                  Text('info@proverbconstruction.com',
                      style: TextStyle(color: Colors.white70)),
                  SizedBox(height: 20),
                  Divider(color: Colors.white30),
                  Text(
                    '© 2024 PROVERB CONSTRUCTION. ALL RIGHTS RESERVED.',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String projectName;
  final String imageUrl;

  const ProjectCard({required this.projectName, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              height: 150,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              projectName,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const ServiceCard({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 50, color: Colors.yellow[700]),
        SizedBox(height: 10),
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
