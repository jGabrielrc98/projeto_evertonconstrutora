import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

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

  // Função para validar e enviar o orçamento
  void _enviarOrcamento() async {
    if (_formKey.currentState?.validate() ?? false) {
      // Criar o conteúdo do e-mail
      final Email email = Email(
        body: 'Nome: ${_nomeController.text}\n'
            'Email: ${_emailController.text}\n'
            'Telefone: ${_telefoneController.text}\n'
            'Assunto: $_assuntoSelecionado\n'
            'Descrição: ${_descricaoController.text}',
        subject: 'Orçamento de ${_nomeController.text}',
        recipients: ['carinaferreiras@icloud.com'],
        isHTML: false, // Definindo que o corpo do e-mail é texto simples
      );

      try {
        // Enviar o e-mail
        await FlutterEmailSender.send(email);
        // Exibir mensagem de sucesso
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Orçamento enviado com sucesso!'),
        ));
      } catch (e) {
        // Exibir erro caso o envio falhe
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Falha ao enviar o orçamento: $e'),
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
            'lib/assets/images/empresaes.png',
            fit: BoxFit.cover,
          ),
        ),
        // Coluna principal
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Text(
                'ORÇAMENTO',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(
                      255, 0, 0, 0), // Defina a cor conforme o fundo
                ),
              ),
              SizedBox(height: 30),
              // Formulário dentro do Container
              Container(
                padding: EdgeInsets.all(16.0),
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
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
                      Text(
                        'Envie seu orçamento',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // Cor preta
                        ),
                      ),
                      SizedBox(height: 20),
                      // Nome
                      TextFormField(
                        controller: _nomeController,
                        decoration: InputDecoration(
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
                      SizedBox(height: 10),
                      // Email
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
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
                      SizedBox(height: 10),
                      // Telefone
                      TextFormField(
                        controller: _telefoneController,
                        decoration: InputDecoration(labelText: 'Telefone'),
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
                      SizedBox(height: 10),
                      // Assunto
                      DropdownButtonFormField<String>(
                        value: _assuntoSelecionado,
                        hint: Text('Selecione um assunto'),
                        onChanged: (value) {
                          setState(() {
                            _assuntoSelecionado = value;
                          });
                        },
                        items:
                            ['PROJETOS', 'CONSTRUÇÕES', 'ADEQUAÇÕES', 'Outros']
                                .map((assunto) => DropdownMenuItem(
                                      value: assunto,
                                      child: Text(assunto),
                                    ))
                                .toList(),
                      ),
                      SizedBox(height: 10),
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
                      SizedBox(height: 20),
                      // Botão Enviar
                      ElevatedButton(
                        onPressed: _isFormValid ? _enviarOrcamento : null,
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                          backgroundColor:
                              _isFormValid ? Colors.green : Colors.red,
                        ),
                        child: Text(
                          'Enviar',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      // Texto abaixo do botão
                      SizedBox(height: 10),
                      Text(
                        'Você precisa preencher todo o formulário para conseguir enviá-lo.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
