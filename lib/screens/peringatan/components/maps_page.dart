// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:custom_info_window/custom_info_window.dart';

// class MapsPage extends StatefulWidget {
//   const MapsPage({Key? key}) : super(key: key);

//   @override
//   State<MapsPage> createState() => _MapsPageState();
// }

// class _MapsPageState extends State<MapsPage> {

//   static const CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(-5.450000, 105.266670),
//     zoom: 10,
//   );

//   final Map<String, Marker> _markers = {};
//   Map<CircleId, Circle> circles = <CircleId, Circle>{};

//   CircleId? selectedCircle;
//   final CustomInfoWindowController _customInfoWindowController =
//       CustomInfoWindowController();

//   Future<void> _fetchMarkers() async {
//     final response = await http.get(Uri.parse(
//         'http://localhost:3000/sensor/output?sensorid[]=kedaton&sensorid[]=sukarame&sensorid[]=rajabasa'));

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);

//       print('Data received: $data');

//       setState(() {
//         for (var item in data['data']) {
//           final marker = Marker(
//             markerId: MarkerId(item['sensorid']),
//             position: LatLng(
//               double.parse(item['latitude']),
//               double.parse(
//                 item['longitude'],
//               ),
//             ),
//             infoWindow: InfoWindow(
//               title: item['sensorid'],
//               snippet:
//                   'Water Level: ${item['water_level']}, Kondisi: ${item['kondisi']}',
//             ),
//           );
//           _markers[item['sensorid']] = marker;
//         }
//       });
//     } else {
//       // throw Exception('Failed to load markers');
//       print('data tidak ada');
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _fetchMarkers();
//   }

//   @override
//   void dispose() {
//     _customInfoWindowController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         GoogleMap(
//           mapType: MapType.normal,
//           initialCameraPosition: _kGooglePlex,
//           onMapCreated: (GoogleMapController controller) {
//             _customInfoWindowController.googleMapController = controller;
//           },
//           markers: _markers.values.toSet(),
//           circles: Set<Circle>.of(circles.values),
//           onTap: (LatLng position) {
//             _customInfoWindowController.hideInfoWindow!();
//           },
//           onCameraMove: (CameraPosition position) {
//             _customInfoWindowController.onCameraMove!();
//           },
//         ),
//         CustomInfoWindow(
//           controller: _customInfoWindowController,
//           height: 75,
//           width: 150,
//           offset: 50,
//         ),
//       ],
//     );
//   }
// }

import 'dart:async';
// import 'dart:convert';
// import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:dio/dio.dart';

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

  late GoogleMapController mapController;
  final Map<String, Marker> _markers = {};
  Map<CircleId, Circle> circles = <CircleId, Circle>{};
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();
  final Dio _dio = Dio();

  @override
  void initState() {
    super.initState();
    _fetchMarkers();
  }

  Future<void> _fetchMarkers() async {
    try {
      print('Fetching markers...');
      final response = await _dio.get(
        'http://10.0.2.2:3000/sensor/output',
        queryParameters: {
          'sensorid[]': ['kedaton', 'sukarame', 'rajabasa']
        },
      );
      print('Response received: ${response.statusCode}');

      if (response.statusCode == 200) {
        final data = response.data;
        print('Data received: $data');

        setState(() {
          for (var item in data['data']) {
            final sensorId = item['sensorid'].toString().toUpperCase();
            final marker = Marker(
              markerId: MarkerId(sensorId),
              position: LatLng(
                double.parse(item['latitude']),
                double.parse(item['longitude']),
              ),
              onTap: () {
                _customInfoWindowController.addInfoWindow!(
                  _buildCustomInfoWindow(item),
                  LatLng(
                    double.parse(item['latitude']),
                    double.parse(item['longitude']),
                  ),
                );
              },
            );
            _markers[sensorId] = marker;
          }
        });
      } else {
        print(
            'Failed to load markers with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching markers: $e');
    }
  }

  Widget _buildCustomInfoWindow(dynamic item) {
    final sensorId = item['sensorid'].toString().toUpperCase();
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 130,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                'assets/images/banjir.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              sensorId,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              'Water Level: ${item['water_level']}, Kondisi: ${item['kondisi']}',
              style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
            ),
          )
        ],
      ),
    );
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
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _customInfoWindowController.googleMapController = controller;
            mapController = controller;
          },
          markers: _markers.values.toSet(),
          onTap: (LatLng position) {
            _customInfoWindowController.hideInfoWindow!();
          },
          onCameraMove: (CameraPosition position) {
            _customInfoWindowController.onCameraMove!();
          },
        ),
        CustomInfoWindow(
          controller: _customInfoWindowController,
          height: 250,
          width: 300,
          offset: 50,
        ),
      ],
    );
  }
}
