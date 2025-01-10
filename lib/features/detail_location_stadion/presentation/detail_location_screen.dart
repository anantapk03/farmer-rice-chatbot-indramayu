import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailLocationScreen extends StatefulWidget {
  const DetailLocationScreen({super.key});

  @override
  State<DetailLocationScreen> createState() => _DetailLocationScreenState();
}

class _DetailLocationScreenState extends State<DetailLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: const Text(
            "Detail Location Stadion",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: const LatLng(52.4862, -1.8904),
            zoom: 8.4746,
          ),
        ));
  }
}
