import 'package:flutter/material.dart';

class Customers extends StatefulWidget {
  const Customers({super.key});

  @override
  _CustomersState createState() => _CustomersState();
}

class _CustomersState extends State<Customers> {
  // Controladores para os números
  int experience = 0;
  int floors = 0;
  int concrete = 0;
  int constructed = 0;
  int painted = 0;

  bool _startAnimation = false;

  final int experienceMax = 7; // Anos de experiência
  final int floorsMax = 5; // KM de pisos assentados
  final int concreteMax = 15; // KM de concreto feito
  final int constructedMax = 30000; // M² construído
  final int paintedMax = 10; // KM de paredes pintadas

  // Função para animar os números
  void _animateNumbers() {
    setState(() {
      _startAnimation = true;
    });
  }

  @override
  void initState() {
    super.initState();
    // Inicia a animação assim que o widget for criado
    _animateNumbers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título
              const Text(
                "Nossa história fala por nós.",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "Nossos números também",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),

              // Números com animação
              if (_startAnimation) ...[
                _buildAnimatedNumber(
                    "Anos de experiência", experience, experienceMax),
                _buildAnimatedNumber(
                    "KM de pisos assentados", floors, floorsMax),
                _buildAnimatedNumber(
                    "KM de concreto feito", concrete, concreteMax),
                _buildAnimatedNumber(
                    "M² construído", constructed, constructedMax),
                _buildAnimatedNumber(
                    "KM de paredes pintadas", painted, paintedMax),
              ],
            ],
          ),
        ),
      ),
    );
  }

  // Widget para mostrar o número com animação usando TweenAnimationBuilder
  Widget _buildAnimatedNumber(String label, int currentValue, int maxValue) {
    return Column(
      children: [
        TweenAnimationBuilder<int>(
          tween: IntTween(begin: currentValue, end: maxValue),
          duration: const Duration(seconds: 10),
          builder: (context, value, child) {
            return Text(
              '$label: $value',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.blue,
              ),
            );
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
