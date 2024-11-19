import 'package:flutter/material.dart';
import 'componets/novbar.dart';
import 'componets/section_one.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0), // Defina a altura do seu AppBar
        child: ResponsiveNavbar(), // Coloque sua barra de navegação aqui
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 10,
              color: Color.fromARGB(0, 185, 185, 185),
            ),
            SectionOne(),
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
            // Outras seções aqui...
          ],
        ),
      ),
    );
  }
}
