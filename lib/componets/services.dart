import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'customers.dart';

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
      color: Colors.black,
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
                  ' Nossos Serviços',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                  textAlign: TextAlign.start,
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
                        decoration: BoxDecoration(),
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
                                    color: Colors.white,
                                    fontSize: 14), // Tamanho menor
                                textAlign: TextAlign.start,
                              ),
                            ),
                            // Ícone "assignment_turned_in_outlined"
                            const Icon(
                              Icons.assignment_turned_in_outlined,
                              color: Colors.white,
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
                          builder: (context) => const Customers(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16),
                    ),
                    child: const Text(
                      'Detalhes',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 16), // Espaço entre os elementos

          // Carrossel de Imagens
          Expanded(
            flex: 4,
            child: CarouselSlider(
              options: CarouselOptions(
                height: 500,
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
