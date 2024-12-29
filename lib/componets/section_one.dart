import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SectionOne extends StatefulWidget {
  const SectionOne({super.key});

  @override
  _SectionOneState createState() => _SectionOneState();
}

class _SectionOneState extends State<SectionOne> {
  final String _videoPathLarge =
      'assets/videos/VideoDeInicio.mp4'; // Caminho do vídeo para telas grandes
  final String _videoPathSmall =
      'assets/videos/videotelasmenores.mp4'; // Caminho do vídeo para telas pequenas
  late VideoPlayerController _controller;
  bool _isAutoplayFailed = false;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer(
        _videoPathLarge); // Inicializa o vídeo padrão para telas grandes
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _initializeVideoPlayer(String videoPath) {
    _controller = VideoPlayerController.asset(videoPath)
      ..initialize().then((_) {
        setState(() {});
        _controller.setLooping(true);
        _controller.setVolume(0.0); // Remove o som para evitar bloqueios
        _attemptPlay();
      }).catchError((error) {
        print('Erro ao inicializar o vídeo: $error');
      });
  }

  void _attemptPlay() {
    _controller.play().catchError((error) {
      print('Erro ao tentar reproduzir automaticamente: $error');
      setState(() {
        _isAutoplayFailed = true;
      });
    });
  }

  void _playVideo() {
    _controller.play();
    setState(() {
      _isAutoplayFailed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width, // Largura total da tela
      height: 600, // Altura fixa
      color: Colors.black,
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Se a largura da tela for menor que 900px, carrega o vídeo alternativo
          bool isSmallScreen = constraints.maxWidth < 900;

          if (isSmallScreen && _controller.dataSource != _videoPathSmall) {
            // Se a tela for pequena, troca para o vídeo alternativo
            _initializeVideoPlayer(_videoPathSmall);
          } else if (!isSmallScreen &&
              _controller.dataSource != _videoPathLarge) {
            // Se a tela for grande, carrega o vídeo principal
            _initializeVideoPlayer(_videoPathLarge);
          }

          return Stack(
            children: [
              // Exibe o vídeo se ele foi inicializado
              _controller.value.isInitialized
                  ? Positioned.fill(
                      child: FittedBox(
                        fit:
                            BoxFit.fill, // O vídeo preencherá o espaço definido
                        child: SizedBox(
                          width: _controller.value.size.width,
                          height: _controller.value.size.height,
                          child: VideoPlayer(_controller),
                        ),
                      ),
                    )
                  : Center(
                      child:
                          CircularProgressIndicator()), // Indicador de carregamento

              // Botão para reprodução manual, caso o autoplay falhe
              if (_isAutoplayFailed)
                Positioned(
                  bottom: 50,
                  left: 50,
                  right: 50,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: _playVideo,
                      child: Text('Clique para reproduzir'),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
