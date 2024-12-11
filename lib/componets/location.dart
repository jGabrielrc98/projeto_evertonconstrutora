import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Fundo preto para a página
      body: Column(
        children: [
          // Título "Localização" centralizado acima do mapa
          Padding(
            padding: const EdgeInsets.all(
                8.0), // Ajuste o padding conforme necessário
            child: Text(
              "Localização",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Texto branco
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 40),
          // Mapa do OpenStreetMap
          Expanded(child: _buildMap()),
          const SizedBox(height: 20),
          // Endereço abaixo do mapa
          _buildAddress(),
        ],
      ),
    );
  }

  /// Função para construir o mapa com o OpenStreetMap
  Widget _buildMap() {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(-12.127834, -38.431536), // Alagoinhas-BA
        zoom: 15,
        minZoom: 5, // Define o zoom mínimo
        maxZoom: 18, // Define o zoom máximo
        interactiveFlags: InteractiveFlag.all, // Permite a interação total
      ),
      children: [
        // Camada de Tiles do OpenStreetMap
        TileLayer(
          urlTemplate:
              "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", // URL para os tiles OSM
          subdomains: [
            'a',
            'b',
            'c'
          ], // Subdomínios para melhorar a performance
        ),
        // Camada de Marcadores
        MarkerLayer(
          markers: [
            Marker(
              point: LatLng(-12.127834, -38.431536),
              width: 60,
              height: 60,
              builder: (ctx) => const Icon(
                Icons.location_on,
                color: Colors.red,
                size: 40,
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// Função para construir o endereço abaixo do mapa
  Widget _buildAddress() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text(
          "3 Travessa Manuel Vasconcelos,",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Texto branco
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          "N° 116, Santo Antonio, Alagoinhas-BA",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Texto branco
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
