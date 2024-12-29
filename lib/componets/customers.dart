import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:visibility_detector/visibility_detector.dart';

class Customers extends StatefulWidget {
  const Customers({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomersState createState() => _CustomersState();
}

class _CustomersState extends State<Customers> with TickerProviderStateMixin {
  // Controladores para os números
  int experience = 0;
  int floors = 0;
  int concrete = 0;
  int constructed = 0;
  int painted = 0;

  bool _startAnimation = false;

  late AnimationController _animationController;

  final int experienceMax = 7; // Anos de experiência
  final int floorsMax = 5; // KM de pisos assentados
  final int concreteMax = 15; // KM de concreto feito
  final int constructedMax = 30000; // M² construído
  final int paintedMax = 10; // KM de paredes pintadas

  // Função para animar os números
  void _animateNumbers() {
    if (!_startAnimation) {
      setState(() {
        _startAnimation = true;
      });
      // Inicia a animação dos números
      _animationController.forward();
    }
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose(); // Destruir o controlador de animação
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Lista de imagens para o carrossel (logos)
    final List<String> images = [
      'assets/logos/logo0.png',
      'assets/logos/logo1.png',
      'assets/logos/logo2.png',
      'assets/logos/logo3.jpg',
      'assets/logos/logo5.png',
      'assets/logos/logo4.png',
      'assets/logos/logo6.jpg',
      'assets/logos/logo7.png',
      'assets/logos/logo8.png',
      'assets/logos/logo9.png',
      'assets/logos/logo10.png',
      'assets/logos/logo11.png',
    ];

    // Lista de imagens fixas acima do carrossel
    final List<String> fixedImages = [
      'assets/logos/logoEstatica1.png',
      'assets/logos/logoEstatica2.png',
      'assets/logos/logoEstatica3.png',
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        // Verifica se a largura da tela é menor que 580px
        bool isSmallScreen = constraints.maxWidth < 580;
        bool isMediumScreen = constraints.maxWidth < 800;

        // Número de imagens por vez no carrossel, dependendo do tamanho da tela
        int imagesPerPage = isSmallScreen ? 3 : (isMediumScreen ? 4 : 6);

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Título
              Text(
                "CLIENTES",
                style: TextStyle(
                  color: const Color.fromARGB(255, 10, 35, 66),
                  fontSize:
                      isSmallScreen ? 28 : 40, // Ajusta o tamanho da fonte
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 25),

              // Exibindo as imagens fixas acima do carrossel
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: fixedImages.map((image) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Image.asset(
                      image,
                      width: MediaQuery.of(context).size.width * 0.25,
                      fit: BoxFit.cover,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 30),

              // Carrossel de imagens (6 ou 3 imagens por vez, dependendo da largura da tela)
              CarouselSlider.builder(
                itemCount: (images.length / imagesPerPage).ceil(),
                itemBuilder: (context, index, realIndex) {
                  // Agrupando imagens por vez
                  int startIndex = index * imagesPerPage;
                  int endIndex = (startIndex + imagesPerPage) > images.length
                      ? images.length
                      : startIndex + imagesPerPage;

                  List<String> imageGroup =
                      images.sublist(startIndex, endIndex);

                  return Container(
                    color: const Color.fromARGB(225, 255, 255, 255),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imageGroup.map((image) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1),
                          child: Image.asset(
                            image,
                            width: MediaQuery.of(context).size.width * 0.15,
                            fit: BoxFit.cover,
                          ),
                        );
                      }).toList(),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 250,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1.0,
                  autoPlay: true,
                  enableInfiniteScroll: true,
                ),
              ),
              const SizedBox(height: 30),

              // Títulos
              Text(
                "NOSSA HISTORIA FALA POR NÓS",
                style: TextStyle(
                  fontSize:
                      isSmallScreen ? 22 : 38, // Ajusta o tamanho da fonte
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "NOSSOS NÚMEROS TAMBÉM ",
                style: TextStyle(
                  fontSize:
                      isSmallScreen ? 22 : 38, // Ajusta o tamanho da fonte
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              // Usando VisibilityDetector para iniciar a animação quando a seção ficar visível
              VisibilityDetector(
                key: const Key('numbers-section'),
                onVisibilityChanged: (visibilityInfo) {
                  if (visibilityInfo.visibleFraction > 0.5 &&
                      !_startAnimation) {
                    _animateNumbers();
                  }
                },
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 40,
                  runSpacing: 20,
                  children: [
                    _buildAnimatedNumber(
                        "Anos de experiência", experience, experienceMax),
                    _buildAnimatedNumber(
                        "KM de pisos assentados", floors, floorsMax),
                    _buildAnimatedNumber(
                        "KM de concreto feito", concrete, concreteMax),
                    _buildAnimatedNumber(
                        "M² construído", constructed, constructedMax),
                    _buildAnimatedNumber(
                        "KM de paredes pintadas", painted, paintedMax),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Widget para mostrar o número com animação usando TweenAnimationBuilder
  Widget _buildAnimatedNumber(String label, int currentValue, int maxValue) {
    return Column(
      children: [
        // Número com estilo maior e negrito
        AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            double percentage = _animationController.value;
            int animatedValue =
                (currentValue + ((maxValue - currentValue) * percentage))
                    .toInt();

            return Text(
              '$animatedValue',
              style: const TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(0, 0, 0, 1),
              ),
            );
          },
        ),
        const SizedBox(height: 5),
        // Texto explicativo sem negrito
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
