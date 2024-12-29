import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class Orcamento extends StatefulWidget {
  const Orcamento({Key? key}) : super(key: key);

  @override
  _OrcamentoState createState() => _OrcamentoState();
}

class _OrcamentoState extends State<Orcamento> {
  final _formKey = GlobalKey<FormState>();

  // Controladores para os campos de texto
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();

  // Variáveis para controle do assunto
  String? _assuntoSelecionado;

  // Função para enviar o orçamento via WhatsApp
  Future<void> _enviarOrcamento() async {
    if (_formKey.currentState?.validate() ?? false) {
      final nome = _nomeController.text;
      final email = _emailController.text;
      final telefone = _telefoneController.text;
      final assunto = _assuntoSelecionado ?? 'Sem Assunto';
      final descricao = _descricaoController.text;

      // Criando a mensagem formatada para enviar via WhatsApp
      final mensagem =
          'Pedido de orçamento de $nome\n\nE-mail: $email\nTelefone: $telefone\nAssunto: $assunto\nDescrição: $descricao';

      const numeroWhatsapp = '+5575981714919';

      // Criando o link do WhatsApp
      final whatsappUrl =
          'https://api.whatsapp.com/send?phone=$numeroWhatsapp&text=${Uri.encodeComponent(mensagem)}';

      // Verificando se o WhatsApp está instalado e abrindo o link
      if (await canLaunch(whatsappUrl)) {
        await launch(whatsappUrl);
      } else {
        // Se não conseguir abrir o WhatsApp
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Erro ao tentar abrir o WhatsApp.',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.red,
        ));
      }
    }
  }

  // Função para verificar se todos os campos obrigatórios estão preenchidos corretamente
  bool get _isFormValid {
    return _formKey.currentState?.validate() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Imagem de fundo
        Positioned.fill(
          child: Image.asset(
            'assets/images/empresaes.png',
            fit: BoxFit.cover,
          ),
        ),
        // Coluna principal
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              const Text(
                'ORÇAMENTO',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 10, 35, 66),
                ),
              ),
              const SizedBox(height: 10),
              // Formulário dentro do Container
              Container(
                padding: const EdgeInsets.all(16.0),
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 4),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Texto "Envie seu orçamento" dentro do formulário
                      const Text(
                        'ENVIE SEU ORÇAMENTO',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(
                              255, 10, 35, 66), // Cor preta
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Nome
                      TextFormField(
                        controller: _nomeController,
                        decoration: const InputDecoration(
                          labelText: 'Nome (obrigatório)',
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !RegExp(r'^[a-zA-Zá-úÁ-ÚçÇ\s]+$')
                                  .hasMatch(value)) {
                            return 'Nome inválido, somente letras, acentos e espaços';
                          }
                          return null;
                        },
                        onChanged: (_) => setState(() {}),
                      ),
                      const SizedBox(height: 10),
                      // Email
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email (obrigatório)',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Email inválido';
                          }
                          return null;
                        },
                        onChanged: (_) => setState(() {}),
                      ),
                      const SizedBox(height: 10),
                      // Telefone
                      TextFormField(
                        controller: _telefoneController,
                        decoration:
                            const InputDecoration(labelText: 'Telefone'),
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        validator: (value) {
                          if (value != null &&
                              value.isNotEmpty &&
                              value.length != 10 &&
                              value.length != 11) {
                            return 'Telefone inválido';
                          }
                          return null;
                        },
                        onChanged: (_) => setState(() {}),
                      ),
                      const SizedBox(height: 10),
                      // Assunto
                      DropdownButtonFormField<String>(
                        value: _assuntoSelecionado,
                        hint: const Text('Selecione um assunto'),
                        onChanged: (value) {
                          setState(() {
                            _assuntoSelecionado = value;
                          });
                        },
                        items:
                            ['PROJETOS', 'CONSTRUÇÕES', 'ADEQUAÇÕES', 'OUTROS']
                                .map((assunto) => DropdownMenuItem(
                                      value: assunto,
                                      child: Text(assunto),
                                    ))
                                .toList(),
                      ),
                      const SizedBox(height: 10),
                      // Descrição
                      TextFormField(
                        controller: _descricaoController,
                        decoration: InputDecoration(labelText: 'Descrição'),
                        maxLines: 5,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Descrição não pode ser vazia';
                          }
                          return null;
                        },
                        onChanged: (_) => setState(() {}),
                      ),
                      const SizedBox(height: 20),
                      // Botão Enviar
                      ElevatedButton(
                        onPressed: _isFormValid ? _enviarOrcamento : null,
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor:
                              _isFormValid ? Colors.green : Colors.red,
                        ),
                        child: const Text(
                          'Enviar',
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      // Texto abaixo do botão
                      const SizedBox(height: 10),
                      const Text(
                        'Você precisa preencher todo o formulário para conseguir enviá-lo.',
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Rodapé
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                padding: const EdgeInsets.all(16.0),
                child: const Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // Para dividir as colunas
                  children: [
                    // Coluna à esquerda
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Alinhando os textos à esquerda
                        children: [
                          Text(
                            'NOME DA EMPRESA: Everton Silva Construtora',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'TELEFONE PARA CONTATO: +5571984414420',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Coluna à direita
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .end, // Alinhando os textos à direita
                        children: [
                          Text(
                            'E-MAIL: adm@construrota.net ',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'INSTAGRAM: @esconstrutorasilva',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
