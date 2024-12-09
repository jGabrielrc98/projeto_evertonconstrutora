import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  // Função para exibir o carrossel de imagens
  void _showImageCarousel(BuildContext context, List<String> imagePaths) {
    int currentPage = 0;
    final PageController pageController = PageController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: const Color.fromARGB(196, 0, 0, 0),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 550,
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: imagePaths.length,
                      onPageChanged: (index) {
                        setState(() {
                          currentPage = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.asset(
                              imagePaths[index],
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (currentPage > 0) {
                            pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          }
                        },
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () {
                          if (currentPage < imagePaths.length - 1) {
                            pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          }
                        },
                        icon: const Icon(Icons.arrow_forward,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(
                      'Fechar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Lista de imagens para o carrossel
    List<String> imagePaths = [
      'lib/assets/images/ImagemOne.jpeg',
      'lib/assets/images/ImagemTwo.jpeg',
      'lib/assets/images/ImagemThree.jpeg',
      'lib/assets/images/ImagemFour.jpeg',
      'lib/assets/images/ImagemFive.jpeg',
    ];

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SOBRE NÓS',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 123, 186, 242),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'A Empresa ES construtora Fundada em junho de 2015 com objetivo de atender as necessidades de manutenção e ampliações da indústria de alimentos, com padrões específicos de segurança, quantidade e prazos de execução estabelecidos pelos clientes. Tendo foco no compromisso de apresentar soluções técnicas para diversos tipos e seguimentos de obras civis, buscando excelência na qualidade, segurança e comprometida com os objetivos a serem atingidos. Temos alcançados nos últimos anos grandes clientes e uma vasta capacidade de execução de atividades variadas em vários estados brasileiros.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                ...List.generate(
                  4,
                  (index) => Card(
                    color: Colors.black,
                    elevation: 50,
                    shadowColor: const Color.fromARGB(255, 155, 155, 155),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: GestureDetector(
                      onTap: () => _showImageCarousel(context, imagePaths),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: AspectRatio(
                          aspectRatio: 70 / 9,
                          child: Image.asset(
                            imagePaths[index % imagePaths.length],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => _showImageCarousel(context, imagePaths),
                  child: const Text('VEJA MAIS IMAGENS!'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
