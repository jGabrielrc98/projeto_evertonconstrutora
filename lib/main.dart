import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '/componets/novbar.dart';
import '/componets/aboutUs.dart';
import '/componets/section_one.dart';
import '/componets/services.dart';
import '/componets/customers.dart';
import '/componets/location.dart';
import '/componets/budget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Everton Silva Construtora/ ESconstrutora/ Alagoinhas',
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontFamily: 'Borel'),
          bodyLarge: TextStyle(fontFamily: 'Quicksand'),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey _sobreNosKey = GlobalKey();
  final GlobalKey _servicosKey = GlobalKey();
  final GlobalKey _clientesKey = GlobalKey();
  final GlobalKey _localizacaoKey = GlobalKey();
  final GlobalKey _orcamentoKey = GlobalKey();

  final ScrollController _scrollController = ScrollController();

  void _scrollToSection(String section) {
    double offset = 0.0;
    switch (section) {
      case 'SOBRE NÓS':
        offset = _getSectionOffset(_sobreNosKey);
        break;
      case 'SERVIÇOS':
        offset = _getSectionOffset(_servicosKey);
        break;
      case 'CLIENTES':
        offset = _getSectionOffset(_clientesKey);
        break;
      case 'LOCALIZAÇÃO':
        offset = _getSectionOffset(_localizacaoKey);
        break;
      case 'ORÇAMENTO GRATUITO':
        offset = _getSectionOffset(_orcamentoKey);
        break;
    }

    _scrollController.animateTo(offset + _scrollController.offset,
        duration: const Duration(seconds: 1), curve: Curves.easeInOut);
  }

  double _getSectionOffset(GlobalKey key) {
    final RenderBox renderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);

    double navBarHeight = 130.0;
    return position.dy - navBarHeight;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Stack(
          children: [
            // Corpo principal com rolagem
            SingleChildScrollView(
              controller: _scrollController,
              child: Container(
                color: const Color.fromARGB(255, 205, 205, 205),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 10,
                      color: const Color.fromARGB(0, 185, 185, 185),
                    ),
                    const SizedBox(height: 120),
                    const SectionOne(),
                    AboutSection(key: _sobreNosKey),
                    ServicesSection(key: _servicosKey),
                    Customers(key: _clientesKey),
                    SizedBox(
                      height: 650,
                      width: double.infinity,
                      child: Location(key: _localizacaoKey),
                    ),
                    Orcamento(key: _orcamentoKey),
                  ],
                ),
              ),
            ),
            // Barra de navegação fixa
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: ResponsiveNavbar(
                scrollToSection: _scrollToSection,
                scrollController: _scrollController,
              ),
            ),
            // Botões flutuantes
            Positioned(
              bottom: 45,
              left: 15,
              child: GestureDetector(
                onTap: () {
                  _launchInstagram();
                },
                child: Container(
                  width: 35.0,
                  height: 35.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color.fromARGB(255, 254, 254, 254),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: SvgPicture.asset(
                    'assets/logos/instagram.svg',
                    color: const Color(0xFFE4405F),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 5,
              left: 15,
              child: GestureDetector(
                onTap: () {
                  _showEmailDialog(context);
                },
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: SvgPicture.asset(
                    'assets/logos/email.svg',
                    width: 35.0,
                    height: 35.0,
                    color: const Color(0xFFE4405F),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchInstagram() async {
    const url =
        'https://www.instagram.com/esconstrutorasilva?igsh=OXQ2c2RobDU4Z2cw';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Não foi possível abrir o Instagram';
    }
  }

  void _showEmailDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Entrar em Contato"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Gostaria de enviar um e-mail?"),
              const Text("Nosso email: adm@construrota.net"),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _sendEmail();
                  Navigator.of(context).pop();
                },
                child: const Text("Enviar E-mail"),
              ),
            ],
          ),
        );
      },
    );
  }

  void _sendEmail() async {
    const email =
        'mailto:adm@construrota.net?subject=Orçamento&body=Olá, gostaria de saber mais sobre os serviços.';

    if (await canLaunch(email)) {
      await launch(email);
    } else {
      throw 'Não foi possível abrir o e-mail';
    }
  }
}
