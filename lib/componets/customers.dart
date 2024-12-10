import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Customers extends StatefulWidget {
  const Customers({super.key});

  @override
  _CustomersState createState() => _CustomersState();
}

class _CustomersState extends State<Customers> {
  // Controladores para os números
  int experience = 0;
  int floors = 0;
  int concrete = 0;
  int constructed = 0;
  int painted = 0;

  bool _startAnimation = false;

  final int experienceMax = 7; // Anos de experiência
  final int floorsMax = 5; // KM de pisos assentados
  final int concreteMax = 15; // KM de concreto feito
  final int constructedMax = 30000; // M² construído
  final int paintedMax = 10; // KM de paredes pintadas

  // Função para animar os números
  void _animateNumbers() {
    setState(() {
      _startAnimation = true;
    });
  }

  @override
  void initState() {
    super.initState();
    // Inicia a animação assim que o widget for criado
    _animateNumbers();
  }

  @override
  Widget build(BuildContext context) {
    // Lista de imagens para o carrossel
    final List<String> images = [
      'lib/assets/logos/logo0.png',
      'lib/assets/logos/logo1.png',
      'lib/assets/logos/logo3.jpg',
      'lib/assets/logos/logo5.png',
      'lib/assets/logos/logo4.png',
      'lib/assets/logos/logo6.jpg',
      'lib/assets/logos/logo8.png',
      'lib/assets/logos/logo9.png',
      'lib/assets/logos/logo10.png',
      'lib/assets/logos/logo11.png',
      'lib/assets/logos/logo12.png',
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          const Text(
            "Clientes",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 25), // Espaço entre o título e o carrossel

          // Carrossel de imagens (4 imagens por vez)
          CarouselSlider.builder(
            itemCount: (images.length / 4)
                .ceil(), // Dividimos a quantidade de imagens por 4
            itemBuilder: (context, index, realIndex) {
              // Agrupando 4 imagens por vez
              int startIndex = index * 4;
              int endIndex = (startIndex + 4) > images.length
                  ? images.length
                  : startIndex + 4;

              List<String> imageGroup =
                  images.sublist(startIndex, endIndex); // Sublista de 4 imagens

              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageGroup.map((image) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 110), // Espaçamento entre as imagens
                    child: Image.asset(
                      image,
                      width: MediaQuery.of(context).size.width *
                          0.10, // Ajustando o tamanho das imagens
                      fit: BoxFit.cover,
                    ),
                  );
                }).toList(),
              );
            },
            options: CarouselOptions(
              height: 250, // Altura do carrossel
              enlargeCenterPage: true,
              aspectRatio: 16 / 9, // Ajuste da relação de aspecto
              viewportFraction: 1.0, // Carrossel ocupa toda a largura da tela
              autoPlay: true, // Ativa a rotação automática
              enableInfiniteScroll: true, // Permite rotação infinita
            ),
          ),

          const SizedBox(height: 30),

          // Título
          const Text(
            "Nossa história fala por nós",
            style: TextStyle(fontSize: 44, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          const Text(
            "Nossos números também",
            style: TextStyle(fontSize: 44, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),

          // Textos em uma única linha
          if (_startAnimation)
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .center, // Ou spaceEvenly, dependendo da necessidade
              children: [
                _buildAnimatedNumber(
                    "Anos de experiência", experience, experienceMax),
                const SizedBox(width: 40), // Espaçamento entre os itens
                _buildAnimatedNumber(
                    "KM de pisos assentados", floors, floorsMax),
                const SizedBox(width: 40),
                _buildAnimatedNumber(
                    "KM de concreto feito", concrete, concreteMax),
                const SizedBox(width: 40),
                _buildAnimatedNumber(
                    "M² construído", constructed, constructedMax),
                const SizedBox(width: 40),
                _buildAnimatedNumber(
                    "KM de paredes pintadas", painted, paintedMax),
              ],
            ),
        ],
      ),
    );
  }

  // Widget para mostrar o número com animação usando TweenAnimationBuilder
  Widget _buildAnimatedNumber(String label, int currentValue, int maxValue) {
    return Column(
      children: [
        Row(
          children: [
            TweenAnimationBuilder<int>(
              tween: IntTween(begin: currentValue, end: maxValue),
              duration: const Duration(seconds: 5),
              builder: (context, value, child) {
                return Text(
                  '$label: $value',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
