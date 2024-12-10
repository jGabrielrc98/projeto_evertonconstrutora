import 'package:flutter/material.dart';
import 'componets/novbar.dart';
import 'componets/aboutUs.dart';
import 'componets/section_one.dart';
import 'componets/services.dart';
import 'componets/customers.dart';
import 'componets/location.dart';

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
            AboutSection(),
            ServicesSection(),
            Customers(),
            Container(
              height: 650,
              width: double.infinity,
              child: Location(),
            )
          ],
        ),
      ),
    );
  }
}
