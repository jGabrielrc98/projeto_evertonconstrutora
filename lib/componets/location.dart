import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  late GoogleMapController mapController;

  // Defina a localização para o mapa
  final LatLng _center = const LatLng(-12.127126, -38.433155); // Alagoinhas-BA

  // Função para configurar o mapa
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Mapa do Google
        Expanded(
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 15,
            ),
            markers: {
              Marker(
                markerId: MarkerId('currentLocation'),
                position: _center,
                infoWindow: InfoWindow(title: 'Localização Atual'),
              ),
            },
          ),
        ),
        const SizedBox(height: 20),
        // Endereço centralizado abaixo do mapa
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              "3 Travessa Manuel Vasconcelos,",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "N° 116, Santo Antonio, Alagoinhas-BA",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
