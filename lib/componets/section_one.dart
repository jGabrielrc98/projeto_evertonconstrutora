import 'package:flutter/material.dart';
import 'dart:async'; // Importando o Timer

class SectionOne extends StatefulWidget {
  const SectionOne({super.key});

  @override
  _SectionOneState createState() => _SectionOneState();
}

class _SectionOneState extends State<SectionOne> {
  // Lista de imagens para o carrossel
  final List<String> _images = [
    'lib/assets/images/imagemInicio.jpeg',
    'lib/assets/images/ImagemOne.jpeg',
    'lib/assets/images/ImagemTwo.jpeg',
    'lib/assets/images/ImagemThree.jpeg',
    'lib/assets/images/ImagemFour.jpeg',
    'lib/assets/images/ImagemFive.jpeg',
    'lib/assets/images/ImagemSix.jpeg',
    'lib/assets/images/ImagemSeven.jpeg',
  ];

  // Índice da imagem atual sendo exibida
  int _currentIndex = 0;

  // Controlador do Timer
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Inicia o Timer para a troca automática de imagens
    _startAutoSlide();
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancela o Timer quando o widget for destruído
    super.dispose();
  }

  // Função que inicia o Timer
  void _startAutoSlide() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      _nextImage(); // Troca a imagem a cada 3 segundos
    });
  }

  // Função para avançar para a próxima imagem
  void _nextImage() {
    setState(() {
      if (_currentIndex < _images.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex =
            0; // Volta para a primeira imagem quando chegar no final
      }
    });
  }

  // Função para voltar para a imagem anterior
  void _prevImage() {
    setState(() {
      if (_currentIndex > 0) {
        _currentIndex--;
      } else {
        _currentIndex = _images.length -
            1; // Vai para a última imagem se já estiver na primeira
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      color: Colors.black,
      child: Stack(
        children: [
          // Exibe a imagem atual do carrossel
          AnimatedSwitcher(
            duration:
                Duration(milliseconds: 500), // Duração da animação de transição
            child: Image.asset(
              _images[_currentIndex],
              key: ValueKey<int>(
                  _currentIndex), // Chave única para cada imagem, necessária para o AnimatedSwitcher
              height: 500,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 20,
            top: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'EVERTON SILVA',
                  style: TextStyle(
                      color: Color.fromARGB(255, 1, 9, 103),
                      fontSize: 36,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'CONSTRUTORA',
                  style: TextStyle(
                      color: Color.fromARGB(255, 1, 9, 103),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'VEJA MAIS',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 87, 124, 255)),
                      child: Text(
                        'SOBRE NÓS',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Botões de navegação (setas)
          Positioned(
            left: 10,
            top: 250, // Ajuste a posição conforme necessário
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 40),
              onPressed: _prevImage,
            ),
          ),
          Positioned(
            right: 10,
            top: 250, // Ajuste a posição conforme necessário
            child: IconButton(
              icon:
                  Icon(Icons.arrow_forward_ios, color: Colors.white, size: 40),
              onPressed: _nextImage,
            ),
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: const SectionOne(), // Chama a SectionOne dentro do body
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}
