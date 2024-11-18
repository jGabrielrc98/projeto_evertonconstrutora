import 'dart:ui';

import 'package:flutter/material.dart';

class ResponsiveNavbar extends StatefulWidget {
  @override
  _ResponsiveNavbarState createState() => _ResponsiveNavbarState();
}

class _ResponsiveNavbarState extends State<ResponsiveNavbar> {
  bool _isMenuOpen = false;
  ScrollController _scrollController = ScrollController();

  // Função para rolar até a seção
  void _scrollToSection(String section) {
    double offset = 0.0;
    switch (section) {
      case 'A EMPRESA':
        offset = 700; // Substitua pelo valor real da posição da seção
        break;
      case 'SERVIÇOS':
        offset = 300.0;
        break;
      case 'CLIENTES':
        offset = 500.0;
        break;
      case 'LOCALIZAÇÃO':
        offset = 700.0;
        break;
    }
    _scrollController.animateTo(
      offset,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  // Função para abrir/fechar o menu lateral
  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              blurRadius: 0,
            ),
          ],
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(75),
          ),
          color: Color.fromARGB(200, 255, 255, 255),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 900) {
              // Navbar para telas grandes
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'lib/assets/images/logo.png',
                        width: 200,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      NavButton(
                        label: 'A EMPRESA',
                        onPressed: () => _scrollToSection('A EMPRESA'),
                      ),
                      NavButton(
                        label: 'SERVIÇOS',
                        onPressed: () => _scrollToSection('SERVIÇOS'),
                      ),
                      NavButton(
                        label: 'CLIENTES',
                        onPressed: () => _scrollToSection('CLIENTES'),
                      ),
                      NavButton(
                        label: 'LOCALIZAÇÃO',
                        onPressed: () => _scrollToSection('LOCALIZAÇÃO'),
                      ),
                      NavButton(
                        label: 'ORÇAMENTO GRATUITO',
                        onPressed: () => _scrollToSection('ORÇAMENTO GRATUITO'),
                      ),
                    ],
                  ),
                ],
              );
            } else {
              // Navbar para telas pequenas
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'lib/assets/images/logo.png',
                    width: 100,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  IconButton(
                    icon: AnimatedIcon(
                      icon: AnimatedIcons.menu_close,
                      progress: AlwaysStoppedAnimation(_isMenuOpen ? 1.0 : 0.0),
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    onPressed: _toggleMenu,
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

class NavButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;

  const NavButton({required this.label, required this.onPressed});

  @override
  _NavButtonState createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(); // Repetir animação continuamente
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isSpecialButton = widget.label == "ORÇAMENTO GRATUITO";

    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
          if (isSpecialButton) _animationController.stop();
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
          if (isSpecialButton) _animationController.repeat();
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 10),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: _isHovered
              ? const Color.fromARGB(255, 123, 186, 242)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: _isHovered ? Colors.blue : Colors.transparent,
            width: 1,
          ),
        ),
        child: Stack(
          children: [
            // Texto do botão
            TextButton(
              onPressed: widget.onPressed,
              child: Text(
                widget.label,
                style: TextStyle(
                  color: _isHovered ? Colors.white : Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            if (isSpecialButton && !_isHovered)
              // Contorno animado
              Positioned.fill(
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return CustomPaint(
                      painter: CirclePainter(
                        progress: _animationController.value,
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// Painter para desenhar o contorno animado
class CirclePainter extends CustomPainter {
  final double progress;

  CirclePainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = const Color.fromARGB(157, 146, 179, 228)
      ..strokeWidth = 3.5
      ..style = PaintingStyle.stroke;

    // Desenhar o caminho circular
    Rect rect = const Rect.fromLTWH(2, 0, 200, 30);

    final Path path = Path()
      ..addRRect(RRect.fromRectAndRadius(rect, const Radius.circular(30)));

    // Calcular o comprimento do caminho
    final PathMetric pathMetric = path.computeMetrics().first;
    final double pathLength = pathMetric.length;

    // Criar um segmento animado
    final Path animatedPath = pathMetric.extractPath(
      progress * pathLength, // Início do segmento
      (progress * pathLength) + (pathLength * 0.4), // Tamanho do segmento
    );

    // Desenhar o segmento
    canvas.drawPath(animatedPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
