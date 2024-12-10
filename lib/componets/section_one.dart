import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SectionOne extends StatefulWidget {
  const SectionOne({super.key});

  @override
  _SectionOneState createState() => _SectionOneState();
}

class _SectionOneState extends State<SectionOne> {
  final String _videoPath = 'lib/assets/videos/VideoDeInicio.mp4';
  late VideoPlayerController _controller;
  bool _isAutoplayFailed = false;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _initializeVideoPlayer() {
    _controller = VideoPlayerController.asset(_videoPath)
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
      child: Container(
        width: MediaQuery.of(context).size.width, // Largura total da tela
        height: 600, // Altura fixa
        color: Colors.black,
        child: Stack(
          children: [
            // Exibe o vídeo se ele foi inicializado
            _controller.value.isInitialized
                ? Positioned.fill(
                    child: FittedBox(
                      fit: BoxFit.fill, // O vídeo preencherá o espaço definido
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
        ),
      ),
    );
  }
}
