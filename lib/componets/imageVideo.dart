import 'package:flutter/material.dart';

class Imagevideo extends StatelessWidget {
  const Imagevideo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const SizedBox(height: 80);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 10, 35, 66),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 205, 205, 205),
        title: const Text(
          'NOSSOS SERVIÇOS',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'Quicksand',
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Voltar para a tela anterior (HomeScreen)
          },
        ),
      ),
      body: NossoServicos(),
    );
  }
}

class NossoServicos extends StatelessWidget {
  NossoServicos({Key? key}) : super(key: key);

  // Lista de URLs das imagens
  final List<String> imageUrls = [
    'assets/images/imagem.jpeg',
    'assets/images/imagem1.jpeg',
    'assets/images/imagem2.jpeg',
    'assets/images/imagem3.jpeg',
    'assets/images/imagem4.jpeg',
    'assets/images/imagem5.jpeg',
    'assets/images/imagem6.jpeg',
    'assets/images/imagem7.jpeg',
    'assets/images/imagem8.jpeg',
    'assets/images/imagem9.jpeg',
    'assets/images/imagem10.jpeg',
    'assets/images/imagem11.jpeg',
    'assets/images/imagem12.jpeg',
    'assets/images/imagem13.jpeg',
    'assets/images/imagem14.jpeg',
    'assets/images/imagem15.jpeg',
    'assets/images/imagem16.jpeg',
    'assets/images/imagem17.jpeg',
    'assets/images/imagem18.jpeg',
    'assets/images/imagem19.jpeg',
    'assets/images/imagem20.jpeg',
    'assets/images/imagem21.jpeg',
    'assets/images/imagem22.jpeg',
    'assets/images/imagem23.jpeg',
    'assets/images/imagem24.jpeg',
    'assets/images/imagem25.jpeg',
    'assets/images/imagem26.jpeg',
    'assets/images/imagem27.jpeg',
    'assets/images/imagem28.jpeg',
    'assets/images/imagem29.jpeg',
    'assets/images/imagem30.jpeg',
    'assets/images/imagem31.jpeg',
    'assets/images/imagem32.jpeg',
    'assets/images/imagem33.jpeg',
    'assets/images/imagem34.jpeg',
    'assets/images/imagem35.jpeg',
    'assets/images/imagem36.jpeg',
    'assets/images/imagem37.jpeg',
    'assets/images/imagem38.jpeg',
    'assets/images/imagem39.jpeg',
    'assets/images/imagem40.jpeg',
    'assets/images/imagem41.jpeg',
    'assets/images/imagem42.jpeg',
    'assets/images/imagem43.jpeg',
    'assets/images/imagem44.jpeg',
    'assets/images/imagem45.jpeg',
    'assets/images/imagem46.jpeg',
    'assets/images/imagem47.jpeg',
    'assets/images/imagem48.jpeg',
    'assets/images/imagem49.jpeg',
    'assets/images/imagem50.jpeg',
    'assets/images/imagem51.jpeg',
    'assets/images/imagem52.jpeg',
    'assets/images/imagem53.jpeg',
    'assets/images/imagem54.jpeg',
    'assets/images/imagem55.jpeg',
    'assets/images/imagem56.jpeg',
    'assets/images/imagem57.jpeg',
    'assets/images/imagem58.jpeg',
    'assets/images/imagem59.jpeg',
    'assets/images/imagem60.jpeg',
    'assets/images/imagem61.jpeg',
    'assets/images/imagem62.jpeg',
    'assets/images/imagem63.jpeg',
    'assets/images/imagem64.jpeg',
    'assets/images/imagem65.jpeg',
    'assets/images/imagem66.jpg',
    'assets/images/imagem67.jfif',
    'assets/images/imagem68.jfif',
    'assets/images/imagem69.jfif',
    'assets/images/imagem70.jfif',
    'assets/images/imagem71.jpg',
    'assets/images/imagem72.jpg',
    'assets/images/imagem73.jpeg',
    'assets/images/imagem74.jpeg',
    'assets/images/imagem75.jpg',
    'assets/images/imagem76.jpg',
    'assets/images/imagem77.jpg',
    'assets/images/imagem78.jpg',
    'assets/images/imagem79.jpg',
    'assets/images/imagem80.jpg',
    'assets/images/imagem81.jpg',
    'assets/images/imagem82.jpg',
    'assets/images/imagem83.jpg',
    'assets/images/imagem84.jpg',
    'assets/images/imagem85.jpg',
    'assets/images/imagem86.jpg',
    'assets/images/imagem87.jpg',
    'assets/images/imagem88.jpg',
    'assets/images/imagem89.jpg',
    'assets/images/imagem90.jpg',
    'assets/images/imagem91.jpg',
    'assets/images/imagem92.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Seção de Imagens
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Três colunas para as imagens
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.5, // Ajusta o tamanho das células
            ),
            itemCount: imageUrls.length, // Quantidade de imagens
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  _showImageModal(context, imageUrls, index);
                },
                child: GridTile(
                  child: Image.asset(
                    imageUrls[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // Função para mostrar a imagem em uma modal e permitir navegação entre as imagens
  void _showImageModal(
      BuildContext context, List<String> imageUrls, int initialIndex) {
    PageController pageController = PageController(initialPage: initialIndex);

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Stack(
            children: [
              // PageView para navegar pelas imagens
              PageView.builder(
                controller: pageController,
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  return Image.asset(
                    imageUrls[index],
                    fit: BoxFit.cover,
                  );
                },
              ),
              // Botões de navegação para avançar e voltar
              Positioned(
                top: MediaQuery.of(context).size.height * 0.4,
                left: 10,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.4,
                right: 10,
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward, color: Colors.white),
                  onPressed: () {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
              // Botão para fechar o modal
              Positioned(
                top: 10,
                left: 10,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.red),
                  onPressed: () {
                    Navigator.of(context).pop(); // Fecha o modal
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context); // Voltar para a tela anterior (HomeScreen)
      },
      child: const Text('Voltar para a Página Inicial'),
    );
  }
}
