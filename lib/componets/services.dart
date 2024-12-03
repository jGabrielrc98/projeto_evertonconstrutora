import 'package:flutter/material.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nossos Serviços'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Stack(
        children: [
          // Fundo com imagem
          Positioned.fill(
            child: Image.asset(
              'lib/assets/images/ImagemFive.jpeg', // Substitua pelo caminho da sua imagem
              fit: BoxFit.cover,
            ),
          ),
          // Conteúdo sobreposto
          Container(
            color: Colors.black.withOpacity(0.5), // Camada semitransparente
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: services.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white.withOpacity(0.9),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    title: Text(
                      services[index],
                      style: const TextStyle(fontSize: 16),
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ServiceDetailsPage(
                              serviceName: services[index],
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Detalhes'),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Página de detalhes
class ServiceDetailsPage extends StatelessWidget {
  final String serviceName;

  const ServiceDetailsPage({super.key, required this.serviceName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(serviceName),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text(
          'Detalhes sobre: $serviceName',
          style: const TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
