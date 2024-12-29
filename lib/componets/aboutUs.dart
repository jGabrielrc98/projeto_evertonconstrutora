import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  // Função para exibir o carrossel de imagens ou vídeos
  void _showMediaCarousel(
      BuildContext context, List<String> mediaPaths, bool isVideo) {
    int currentPage = 0;
    final PageController pageController = PageController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: const Color.fromARGB(255, 10, 35, 66),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 550,
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: mediaPaths.length,
                      onPageChanged: (index) {
                        setState(() {
                          currentPage = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        if (isVideo) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: VideoPlayerWidget(
                                  videoPath: mediaPaths[index]),
                            ),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.asset(
                                mediaPaths[index],
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }
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
                          if (currentPage < mediaPaths.length - 1) {
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
      'assets/images/imagem.jpeg',
      'assets/images/imagem2.jpeg',
      'assets/images/imagem22.jpeg',
      'assets/images/imagem4.jpeg',
    ];

    // Lista de vídeos para o carrossel
    List<String> videoPaths = [
      'assets/videos/video.mp4',
      'assets/videos/video1.mp4',
      'assets/videos/video2.mp4',
      'assets/videos/video3.mp4',
    ];

    return Padding(
      padding: const EdgeInsets.all(20),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isSmallScreen = constraints.maxWidth < 1000;

          return Container(
            color: const Color.fromARGB(255, 205, 205, 205),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (isSmallScreen) ...[
                  const Text(
                    'SOBRE NÓS',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 10, 35, 66),
                      fontFamily: 'Borel',
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'A Empresa ES construtora Fundada em junho de 2015 com objetivo de atender as necessidades de manutenção e ampliações da indústria de alimentos, com padrões específicos de segurança, quantidade e prazos de execução estabelecidos pelos clientes. Tendo foco no compromisso de apresentar soluções técnicas para diversos tipos e seguimentos de obras civis, buscando excelência na qualidade, segurança e comprometida com os objetivos a serem atingidos. Temos alcançados nos últimos anos grandes clientes e uma vasta capacidade de execução de atividades variadas em vários estados brasileiros.',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
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
                        onTap: () => _showMediaCarousel(context, imagePaths,
                            false), // Exibe o carrossel de imagens
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
                  HoverAnimationButton(
                    label: 'CLIQUE PARA VER MAIS!',
                    onPressed: () => _showMediaCarousel(context, videoPaths,
                        true), // Exibe o carrossel de vídeos
                  ),
                ],
                if (!isSmallScreen) ...[
                  Container(
                    color: const Color.fromARGB(255, 205, 205, 205),
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
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 10, 35, 66),
                                  fontFamily: 'Borel',
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'A Empresa ES construtora Fundada em junho de 2015 com objetivo de atender as necessidades de manutenção e ampliações da indústria de alimentos, com padrões específicos de segurança, quantidade e prazos de execução estabelecidos pelos clientes. Tendo foco no compromisso de apresentar soluções técnicas para diversos tipos e seguimentos de obras civis, buscando excelência na qualidade, segurança e comprometida com os objetivos a serem atingidos. Temos alcançados nos últimos anos grandes clientes e uma vasta capacidade de execução de atividades variadas em vários estados brasileiros.',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.bold,
                                ),
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
                                  shadowColor:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: GestureDetector(
                                    onTap: () => _showMediaCarousel(
                                        context,
                                        imagePaths,
                                        false), // Exibe o carrossel de imagens
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
                              HoverAnimationButton(
                                label: 'CLIQUE PARA VER MAIS!',
                                onPressed: () => _showMediaCarousel(
                                    context,
                                    videoPaths,
                                    true), // Exibe o carrossel de vídeos
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}

class HoverAnimationButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;

  const HoverAnimationButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  _HoverAnimationButtonState createState() => _HoverAnimationButtonState();
}

class _HoverAnimationButtonState extends State<HoverAnimationButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() {
        _isHovered = true;
      }),
      onExit: (_) => setState(() {
        _isHovered = false;
      }),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: _isHovered ? Colors.blueAccent : Colors.blue,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          widget.label,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoPath;

  const VideoPlayerWidget({super.key, required this.videoPath});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {});
        _controller.play(); // Adicionando a reprodução automática
      });
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        : const Center(child: CircularProgressIndicator());
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
