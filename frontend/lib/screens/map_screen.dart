import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _controller;

  final LatLng _initialPosition = LatLng(-1.286389, 36.817223); // Nairobi center

  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    // TODO: Fetch agents from backend and add markers
    _loadAgentMarkers();
  }

  void _loadAgentMarkers() {
    // Example static markers for demonstration
    setState(() {
      _markers.addAll([
        Marker(
          markerId: MarkerId('agent1'),
          position: LatLng(-1.28333, 36.81667),
          infoWindow: InfoWindow(title: 'Agent 1', snippet: 'Nairobi'),
        ),
        Marker(
          markerId: MarkerId('agent2'),
          position: LatLng(-1.29207, 36.82194),
          infoWindow: InfoWindow(title: 'Agent 2', snippet: 'Nairobi'),
        ),
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map - HustleHub'),
        centerTitle: true,
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: _initialPosition, zoom: 12),
        markers: _markers,
        onMapCreated: (controller) {
          _controller = controller;
        },
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}
