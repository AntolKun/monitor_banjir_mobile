import 'package:flutter/material.dart';
import 'package:monitor_banjir/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailDataBanjirPage extends StatelessWidget {
  final Map<String, dynamic> data;

  DetailDataBanjirPage({required this.data});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail ${data['sensorid'].toUpperCase()}'),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          gradient: kPrimaryGradientColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            const Text.rich(
              TextSpan(
                text: "Banjir",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Image.asset(
              'assets/images/banjir.png',
              alignment: Alignment.center,
              width: 50,
              height: 50,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 15,
                  height: 15,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Status: ${data['kondisi']}",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildDetailRow("Sensor ID:", data['sensorid'].toUpperCase()),
            _buildDetailRow("Water Level:", "${data['water_level']} cm"),
            _buildDetailRow("Latitude:", data['latitude']),
            _buildDetailRow("Longitude:", data['longitude']),
            _buildDetailRow("Created At:", data['created_at']),
            _buildClickableRow("Lokasi:", data['lokasi']),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClickableRow(String label, String url) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => _launchURL(url),
              child: Text(
                url,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
