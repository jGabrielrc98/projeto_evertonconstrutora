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
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // GlobalKeys para cada seção
  final GlobalKey _sobreNosKey = GlobalKey();
  final GlobalKey _servicosKey = GlobalKey();
  final GlobalKey _clientesKey = GlobalKey();
  final GlobalKey _localizacaoKey = GlobalKey();
  final GlobalKey _orcamentoKey = GlobalKey();

  // Criação do ScrollController para controlar a rolagem
  final ScrollController _scrollController = ScrollController();

  // Função para rolar para a seção específica
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

    // Anima a rolagem até a seção desejada, mantendo o controle de rolagem
    _scrollController.animateTo(offset + _scrollController.offset,
        duration: const Duration(seconds: 1), curve: Curves.easeInOut);
  }

  // Função para obter a posição de uma seção com base no GlobalKey
  double _getSectionOffset(GlobalKey key) {
    final RenderBox renderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);

    // Considerando a altura da barra de navegação (ajustando a rolagem para que as seções fiquem abaixo dela)
    double navBarHeight =
        100.0; // Altura fixa da barra de navegação, você pode alterar conforme necessário
    return position.dy - navBarHeight;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: ResponsiveNavbar(
          scrollToSection: _scrollToSection,
          scrollController: _scrollController,
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController, // Associando o controlador
        child: Container(
          color: const Color.fromARGB(255, 205, 205, 205),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  height: 10, color: const Color.fromARGB(0, 185, 185, 185)),
              const SectionOne(), // Esta seção não faz parte do menu de navegação, então não precisa de GlobalKey
              AboutSection(key: _sobreNosKey),
              ServicesSection(key: _servicosKey),
              Customers(key: _clientesKey),
              SizedBox(
                  height: 650,
                  width: double.infinity,
                  child: Location(key: _localizacaoKey)),
              Orcamento(key: _orcamentoKey),
            ],
          ),
        ),
      ),
      // Botões flutuantes
      floatingActionButtonLocation: FloatingActionButtonLocation
          .startFloat, // Coloca os botões no lado esquerdo
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Botão do Instagram (um pouco mais para baixo)
          Padding(
            padding: const EdgeInsets.only(
                bottom: 0.0, left: 10.0), // Ajuste o padding
            child: GestureDetector(
              onTap: () {
                _launchInstagram(); // Função para abrir o Instagram
              },
              child: Container(
                width: 35.0, // Ajuste o tamanho do ícone
                height: 35.0, // Ajuste o tamanho do ícone
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
                  'lib/assets/logos/instagram.svg',
                  color: const Color(0xFFE4405F),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 0.0, left: 0.0),
            child: FloatingActionButton(
              onPressed: () {
                _showEmailDialog(context); //
              },
              backgroundColor: Colors.transparent, // Remove o fundo
              elevation: 0,
              child: const Icon(
                Icons.email,
                size: 40,
                color: Color(0xFFE4405F),
              ), // Remove a sombra
            ),
          ),
        ],
      ),
    );
  }

  // Função para abrir o Instagram
  void _launchInstagram() async {
    const url =
        'https://www.instagram.com/esconstrutorasilva?igsh=OXQ2c2RobDU4Z2cw'; // Substitua pelo seu link do Instagram
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Não foi possível abrir o Instagram';
    }
  }

  // Função que exibe um diálogo/modal quando o botão de e-mail é pressionado
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
                  // Lógica para abrir o cliente de e-mail (Gmail)
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

  // Função para abrir o Gmail com o e-mail já preenchido
  void _sendEmail() async {
    const email =
        'mailto:adm@construrota.net?subject=Orçamento&body=Olá, gostaria de saber mais sobre os serviços.';

    // Verifica se o dispositivo pode abrir o link
    if (await canLaunch(email)) {
      await launch(email);
    } else {
      throw 'Não foi possível abrir o e-mail';
    }
  }
}
