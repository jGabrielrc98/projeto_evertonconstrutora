import 'dart:ui';
import 'package:flutter/material.dart';

class ResponsiveNavbar extends StatefulWidget {
  final Function(String) scrollToSection;

  const ResponsiveNavbar(
      {super.key,
      required this.scrollToSection,
      required ScrollController scrollController});

  @override
  _ResponsiveNavbarState createState() => _ResponsiveNavbarState();
}

class _ResponsiveNavbarState extends State<ResponsiveNavbar> {
  bool _isMenuOpen = false;

  // Função para abrir o menu no modal
  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
    });
    if (_isMenuOpen) {
      _showMenuModal();
    }
  }

  // Função para exibir o modal
  void _showMenuModal() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 10,
          child: Transform.translate(
            offset: const Offset(38, 0), // Desloca 20 pixels para a direita
            child: Align(
              alignment: Alignment.topRight, // Alinha ao topo e à direita
              child: Container(
                padding: const EdgeInsets.all(0),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(200),
                    bottomLeft: Radius.circular(200),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 4),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.close, // Ícone de fechar (X)
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(); // Fecha o modal ao clicar
                      },
                    ),
                    // Botões de navegação com espaçamento
                    NavButton(
                      label: 'SOBRE NÓS',
                      onPressed: () {
                        widget.scrollToSection('SOBRE NÓS');
                        Navigator.of(context).pop(); // Fecha o modal ao clicar
                      },
                    ),
                    const SizedBox(height: 30),
                    NavButton(
                      label: 'SERVIÇOS',
                      onPressed: () {
                        widget.scrollToSection('SERVIÇOS');
                        Navigator.of(context).pop(); // Fecha o modal ao clicar
                      },
                    ),
                    const SizedBox(height: 30),
                    NavButton(
                      label: 'CLIENTES',
                      onPressed: () {
                        widget.scrollToSection('CLIENTES');
                        Navigator.of(context).pop(); // Fecha o modal ao clicar
                      },
                    ),
                    const SizedBox(height: 30),
                    NavButton(
                      label: 'LOCALIZAÇÃO',
                      onPressed: () {
                        widget.scrollToSection('LOCALIZAÇÃO');
                        Navigator.of(context).pop(); // Fecha o modal ao clicar
                      },
                    ),
                    const SizedBox(height: 30),
                    NavButton(
                      label: 'ORÇAMENTO GRATUITO',
                      onPressed: () {
                        widget.scrollToSection('ORÇAMENTO GRATUITO');
                        Navigator.of(context).pop(); // Fecha o modal ao clicar
                      },
                      hasAnimatedBorder:
                          true, // Define a animação no botão específico
                    ),
                    const SizedBox(height: 50),
                    Image.asset(
                      alignment: AlignmentDirectional.bottomStart,
                      'assets/images/logo.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
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
            if (constraints.maxWidth > 1000) {
              // Navbar para telas grandes
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        width: 200,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      NavButton(
                        label: 'SOBRE NÓS',
                        onPressed: () => widget.scrollToSection('SOBRE NÓS'),
                      ),
                      NavButton(
                        label: 'SERVIÇOS',
                        onPressed: () => widget.scrollToSection('SERVIÇOS'),
                      ),
                      NavButton(
                        label: 'CLIENTES',
                        onPressed: () => widget.scrollToSection('CLIENTES'),
                      ),
                      NavButton(
                        label: 'LOCALIZAÇÃO',
                        onPressed: () => widget.scrollToSection('LOCALIZAÇÃO'),
                      ),
                      NavButton(
                        label: 'ORÇAMENTO GRATUITO',
                        onPressed: () =>
                            widget.scrollToSection('ORÇAMENTO GRATUITO'),
                        hasAnimatedBorder:
                            true, // Habilita a animação para o botão específico
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
                    'assets/images/logo.png',
                    width: 100,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.menu, // Ícone do menu
                      color: Colors.black,
                    ),
                    onPressed: _toggleMenu, // Chama o toggle do menu
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
  final bool hasAnimatedBorder; // Flag para o botão específico

  const NavButton(
      {super.key,
      required this.label,
      required this.onPressed,
      this.hasAnimatedBorder = false}); // Por padrão, sem borda animada

  @override
  _NavButtonState createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true; // Quando o mouse entra, muda o estado
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false; // Quando o mouse sai, volta ao estado original
        });
      },
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 300), // Duração da animação
        padding: widget.hasAnimatedBorder && !_isHovered
            ? const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 20.0) // Padding aumentado quando hover
            : const EdgeInsets.symmetric(
                vertical: 8.0, horizontal: 16.0), // Padding normal
        curve: Curves.easeInOut, // Curva de animação
        child: AnimatedContainer(
          duration: const Duration(
              milliseconds: 1000), // Duração da animação da borda
          decoration: BoxDecoration(
            border: widget.hasAnimatedBorder
                ? Border.all(
                    color: _isHovered
                        ? Colors.blue
                        : Colors.transparent, // Cor da borda
                    width: 2,
                  )
                : null,
            borderRadius: BorderRadius.circular(20),
            boxShadow: widget.hasAnimatedBorder
                ? [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: Offset(0, 0),
                    ),
                  ]
                : [],
          ),
          child: TextButton(
            onPressed: widget.onPressed,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                _isHovered
                    ? Colors.blue
                    : Colors.transparent, // Muda a cor para azul quando hover
              ),
              foregroundColor: MaterialStateProperty.all(
                _isHovered
                    ? Colors.white
                    : Colors
                        .black, // Muda a cor do texto para branco quando hover
              ),
            ),
            child: Text(
              widget.label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontFamily: 'Borel', // Usando a fonte 'Borel'
                      ) ??
                  const TextStyle(fontFamily: 'Borel'), // Aplicando a fonte
            ),
          ),
        ),
      ),
    );
  }
}
