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
    'lib/assets/images/imagem.jpeg',
    'lib/assets/images/imagem1.jpeg',
    'lib/assets/images/imagem2.jpeg',
    'lib/assets/images/imagem3.jpeg',
    'lib/assets/images/imagem4.jpeg',
    'lib/assets/images/imagem5.jpeg',
    'lib/assets/images/imagem6.jpeg',
    'lib/assets/images/imagem7.jpeg',
    'lib/assets/images/imagem8.jpeg',
    'lib/assets/images/imagem9.jpeg',
    'lib/assets/images/imagem10.jpeg',
    'lib/assets/images/imagem11.jpeg',
    'lib/assets/images/imagem12.jpeg',
    'lib/assets/images/imagem13.jpeg',
    'lib/assets/images/imagem14.jpeg',
    'lib/assets/images/imagem15.jpeg',
    'lib/assets/images/imagem16.jpeg',
    'lib/assets/images/imagem17.jpeg',
    'lib/assets/images/imagem18.jpeg',
    'lib/assets/images/imagem19.jpeg',
    'lib/assets/images/imagem20.jpeg',
    'lib/assets/images/imagem21.jpeg',
    'lib/assets/images/imagem22.jpeg',
    'lib/assets/images/imagem23.jpeg',
    'lib/assets/images/imagem24.jpeg',
    'lib/assets/images/imagem25.jpeg',
    'lib/assets/images/imagem26.jpeg',
    'lib/assets/images/imagem27.jpeg',
    'lib/assets/images/imagem28.jpeg',
    'lib/assets/images/imagem29.jpeg',
    'lib/assets/images/imagem30.jpeg',
    'lib/assets/images/imagem31.jpeg',
    'lib/assets/images/imagem32.jpeg',
    'lib/assets/images/imagem33.jpeg',
    'lib/assets/images/imagem34.jpeg',
    'lib/assets/images/imagem35.jpeg',
    'lib/assets/images/imagem36.jpeg',
    'lib/assets/images/imagem37.jpeg',
    'lib/assets/images/imagem38.jpeg',
    'lib/assets/images/imagem39.jpeg',
    'lib/assets/images/imagem40.jpeg',
    'lib/assets/images/imagem41.jpeg',
    'lib/assets/images/imagem42.jpeg',
    'lib/assets/images/imagem43.jpeg',
    'lib/assets/images/imagem44.jpeg',
    'lib/assets/images/imagem45.jpeg',
    'lib/assets/images/imagem46.jpeg',
    'lib/assets/images/imagem47.jpeg',
    'lib/assets/images/imagem48.jpeg',
    'lib/assets/images/imagem49.jpeg',
    'lib/assets/images/imagem50.jpeg',
    'lib/assets/images/imagem51.jpeg',
    'lib/assets/images/imagem52.jpeg',
    'lib/assets/images/imagem53.jpeg',
    'lib/assets/images/imagem54.jpeg',
    'lib/assets/images/imagem55.jpeg',
    'lib/assets/images/imagem56.jpeg',
    'lib/assets/images/imagem57.jpeg',
    'lib/assets/images/imagem58.jpeg',
    'lib/assets/images/imagem59.jpeg',
    'lib/assets/images/imagem60.jpeg',
    'lib/assets/images/imagem61.jpeg',
    'lib/assets/images/imagem62.jpeg',
    'lib/assets/images/imagem63.jpeg',
    'lib/assets/images/imagem64.jpeg',
    'lib/assets/images/imagem65.jpeg',
    'lib/assets/images/imagem66.jpg',
    'lib/assets/images/imagem67.jfif',
    'lib/assets/images/imagem68.jfif',
    'lib/assets/images/imagem69.jfif',
    'lib/assets/images/imagem70.jfif',
    'lib/assets/images/imagem71.jpg',
    'lib/assets/images/imagem72.jpg',
    'lib/assets/images/imagem73.jpeg',
    'lib/assets/images/imagem74.jpeg',
    'lib/assets/images/imagem75.jpg',
    'lib/assets/images/imagem76.jpg',
    'lib/assets/images/imagem77.jpg',
    'lib/assets/images/imagem78.jpg',
    'lib/assets/images/imagem79.jpg',
    'lib/assets/images/imagem80.jpg',
    'lib/assets/images/imagem81.jpg',
    'lib/assets/images/imagem82.jpg',
    'lib/assets/images/imagem83.jpg',
    'lib/assets/images/imagem84.jpg',
    'lib/assets/images/imagem85.jpg',
    'lib/assets/images/imagem86.jpg',
    'lib/assets/images/imagem87.jpg',
    'lib/assets/images/imagem88.jpg',
    'lib/assets/images/imagem89.jpg',
    'lib/assets/images/imagem90.jpg',
    'lib/assets/images/imagem91.jpg',
    'lib/assets/images/imagem92.jpg',
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
