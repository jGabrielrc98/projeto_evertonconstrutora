import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

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

  final String _sendGridApiKey = 'aUs0T1H9rIKjeuXS4Ct5Wjq13OJiTjo7';

  // Função para enviar o orçamento via SendGrid
  Future<void> _enviarOrcamento() async {
    if (_formKey.currentState?.validate() ?? false) {
      final nome = _nomeController.text;
      final email = _emailController.text;
      final telefone = _telefoneController.text;
      final assunto = _assuntoSelecionado ?? 'Sem Assunto';
      final descricao = _descricaoController.text;

      // Criar o corpo do e-mail para enviar via SendGrid
      final emailData = {
        "personalizations": [
          {
            "to": [
              {"email": "carinaferreiras@icloud.com"} // Destinatário do e-mail
            ],
            "subject": 'Orçamento de $nome'
          }
        ],
        "from": {"email": "seu-email@dominio.com"}, // Substitua pelo seu e-mail
        "content": [
          {
            "type": "text/plain",
            "value":
                'Nome: $nome\nEmail: $email\nTelefone: $telefone\nAssunto: $assunto\nDescrição: $descricao'
          }
        ]
      };

      // Enviar a requisição HTTP para a API do SendGrid
      try {
        final response = await http.post(
          Uri.parse('https://api.sendgrid.com/v3/mail/send'),
          headers: {
            'Authorization': 'Bearer $_sendGridApiKey',
            'Content-Type': 'application/json',
          },
          body: json.encode(emailData),
        );

        if (response.statusCode == 202) {
          // Exibir mensagem de sucesso
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              'Orçamento enviado com sucesso!',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.green,
          ));
        } else {
          // Exibir erro
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              'Falha ao enviar o orçamento: ${response.body}',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 54, 244, 190),
          ));
        }
      } catch (e) {
        // Exibir erro em caso de exceção
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            'Erro ao enviar o orçamento: $e',
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
