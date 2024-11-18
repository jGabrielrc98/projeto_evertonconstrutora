import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
