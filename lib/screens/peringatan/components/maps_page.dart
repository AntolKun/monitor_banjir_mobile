import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:custom_info_window/custom_info_window.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({Key? key}) : super(key: key);

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-5.450000, 105.266670),
    zoom: 10,
  );

  final Map<String, Marker> _markers = {};
  Map<CircleId, Circle> circles = <CircleId, Circle>{};

  CircleId? selectedCircle;
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  Future<void> _fetchMarkers() async {
    final response = await http.get(Uri.parse(
        'http://localhost:3000/sensor/output?sensorid[]=kedaton&sensorid[]=sukarame&sensorid[]=rajabasa'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      print('Data received: $data');

      setState(() {
        for (var item in data['data']) {
          final marker = Marker(
            markerId: MarkerId(item['sensorid']),
            position: LatLng(
              double.parse(item['latitude']),
              double.parse(
                item['longitude'],
              ),
            ),
            infoWindow: InfoWindow(
              title: item['sensorid'],
              snippet:
                  'Water Level: ${item['water_level']}, Kondisi: ${item['kondisi']}',
            ),
          );
          _markers[item['sensorid']] = marker;
        }
      });
    } else {
      // throw Exception('Failed to load markers');
      print('data tidak ada');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchMarkers();
  }

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _customInfoWindowController.googleMapController = controller;
          },
          markers: _markers.values.toSet(),
          circles: Set<Circle>.of(circles.values),
          onTap: (LatLng position) {
            _customInfoWindowController.hideInfoWindow!();
          },
          onCameraMove: (CameraPosition position) {
            _customInfoWindowController.onCameraMove!();
          },
        ),
        CustomInfoWindow(
          controller: _customInfoWindowController,
          height: 75,
          width: 150,
          offset: 50,
        ),
      ],
    );
  }
}
