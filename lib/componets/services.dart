import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'location.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de serviços
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

    // Lista de imagens para o carrossel
    final List<String> imageUrls = [
      'lib/assets/images/ImagemOne.jpeg',
      'lib/assets/images/ImagemTwo.jpeg',
      'lib/assets/images/ImagemThree.jpeg',
      'lib/assets/images/ImagemFour.jpeg',
      'lib/assets/images/ImagemFive.jpeg',
    ];

    return Container(
      // Aqui substituímos a cor de fundo por uma imagem
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/assets/images/imagemfundoServico.jpg'),
          fit: BoxFit.cover, // A imagem vai cobrir todo o espaço disponível
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
      child: Row(
        children: [
          // Coluna de Serviços
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Nossos Serviços',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                // Lista de serviços com animação de hover
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
                        margin: const EdgeInsets.only(
                            bottom: 8), // Diminuir o espaço entre os itens
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(30)),
                          color: Color.fromARGB(162, 255, 255, 255),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 20), // Diminuir padding
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Nome do serviço
                            Expanded(
                              child: Text(
                                services[index],
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18), // Tamanho menor
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
                // Botão de detalhes
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Location(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(162, 255, 255, 255),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16),
                    ),
                    child: const Text(
                      'Detalhes',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 16), // Espaço entre os elementos

          // Carrossel de Imagens
          Expanded(
            flex: 3,
            child: CarouselSlider(
              options: CarouselOptions(
                height: 350,
                autoPlay: true,
                autoPlayInterval:
                    const Duration(seconds: 3), // Trocar a cada 3 segundos
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
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceDetailsPage extends StatelessWidget {
  const ServiceDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes dos Serviços'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: const Text(
          'Página de detalhes para cada serviço (com imagens)',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
