import 'package:flutter/material.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de serviços
    final List<String> services = [
      'Projetos de fundação, estrutural, Arquitetônico, instalação elétrica e hidrossanitária',
      'Topografia',
      'Fundações',
      'Infraestrutura',
      'Terraplanagem',
      'Drenagem',
      'Acabamentos e Revestimentos',
      'Demolição',
      'Reforma',
      'Steel Frame',
      'Drywall',
    ];

    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Nossos Serviços',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 3,
            ),
            itemCount: services.length,
            itemBuilder: (context, index) {
              return MouseRegion(
                onEnter: (_) {},
                onExit: (_) {},
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white),
                  ),
                  child: Center(
                    child: Text(
                      services[index],
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 40),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ServiceDetailsPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              child: const Text(
                'Detalhes',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceDetailsPage extends StatelessWidget {
  const ServiceDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes dos Serviços'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: const Text(
          'Página de detalhes para cada serviço (com imagens)',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
