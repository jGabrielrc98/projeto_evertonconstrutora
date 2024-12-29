import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:projeto_evertonconstrutora/componets/imageVideo.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> services = [
      'Projetos de fundação, estrutural, Arquitetônico, instalação elétrica e hidrossanitária',
      'Topografia',
      'Fundações',
      'Infraestrutura',
      'Terraplanagem',
      'Drenagem',
      'Acabamentos e Revestimentos',
      'Demolição',
      'Reforma',
      'Steel Frame',
      'Drywall',
    ];

    final List<String> imageUrls = [
      'assets/images/imagem2.jpeg',
      'assets/images/imagem3.jpeg',
      'assets/images/imagem4.jpeg',
      'assets/images/imagem28.jpeg',
      'assets/images/imagem34.jpeg',
      'assets/images/imagem40.jpeg',
      'assets/images/imagem43.jpeg',
      'assets/images/imagem48.jpeg',
      'assets/images/imagem54.jpeg',
      'assets/images/imagem62.jpeg',
      'assets/images/imagem64.jpeg',
      'assets/images/imagem66.jpg',
      'assets/images/imagem65.jpeg',
      'assets/images/imagem89.jpg',
      'assets/images/imagem91.jpg',
    ];

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/imagemfundoServico.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isSmallScreen = constraints.maxWidth < 1000;

          return isSmallScreen
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'NOSSOS SERVIÇOS',
                      style: TextStyle(
                        color: Color.fromARGB(255, 10, 35, 66),
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: services.length,
                      itemBuilder: (context, index) {
                        return MouseRegion(
                          onEnter: (_) {},
                          onExit: (_) {},
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            margin: const EdgeInsets.only(bottom: 8),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(30)),
                              color: Color.fromARGB(162, 205, 205, 205),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    services[index],
                                    style: const TextStyle(
                                      fontFamily: 'Quicksand',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 40),
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 350,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        viewportFraction: 1.0,
                      ),
                      items: imageUrls.map((url) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(url),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 40),
                    Center(
                      child: AnimatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Imagevideo(),
                            ),
                          );
                        },
                        child: const Text(
                          'CLIQUE AQUI E VEJA MAIS IMAGENS', // Texto alterado
                          style: TextStyle(
                            color: Colors.black, // Cor do texto
                            fontSize: 16, // Tamanho da fonte
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            'NOSSOS SERVIÇOS',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 30),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: services.length,
                            itemBuilder: (context, index) {
                              return MouseRegion(
                                onEnter: (_) {},
                                onExit: (_) {},
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                  margin: const EdgeInsets.only(bottom: 8),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(30)),
                                    color: Color.fromARGB(162, 205, 205, 205),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          services[index],
                                          style: const TextStyle(
                                            fontFamily: 'Quicksand',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 40),
                          Center(
                            child: AnimatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Imagevideo(),
                                  ),
                                );
                              },
                              child: const Text(
                                'CLIQUE AQUI E VEJA MAIS IMAGENS', // Texto alterado
                                style: TextStyle(
                                  color: Colors.black, // Cor do texto (preta)
                                  fontSize: 16, // Tamanho da fonte ajustado
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 3,
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: 350,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          enlargeCenterPage: true,
                          enableInfiniteScroll: true,
                          viewportFraction: 0.8,
                        ),
                        items: imageUrls.map((url) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(url),
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}

// Implementação do botão com animação
class AnimatedButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;

  const AnimatedButton(
      {super.key, required this.onPressed, required this.child});

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            _isHovered = true;
          });
        },
        onExit: (_) {
          setState(() {
            _isHovered = false;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color:
                _isHovered ? Colors.blue : Colors.grey, // Altera a cor de fundo
            borderRadius: _isHovered
                ? BorderRadius.circular(15)
                : BorderRadius.circular(100), // Borda arredondada
            border: Border.all(
              color: _isHovered ? Colors.blue : Colors.black, // Cor da borda
              width: 2,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: widget.child,
        ),
      ),
    );
  }
}
