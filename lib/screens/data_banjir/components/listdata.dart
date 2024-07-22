import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monitor_banjir/constants.dart';
import 'package:dio/dio.dart';
import 'package:monitor_banjir/screens/data_banjir/components/detaildatabanjir.dart';
// import 'detail_page.dart'; 

class ListDataBanjir extends StatefulWidget {
  const ListDataBanjir({super.key});

  @override
  _ListDataBanjirState createState() => _ListDataBanjirState();
}

class _ListDataBanjirState extends State<ListDataBanjir> {
  List<Map<String, dynamic>> _dataList =
      []; // Ubah tipe data dari String ke dynamic
  final Dio _dio = Dio();

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final response = await _dio
          .get('http://10.0.2.2:3000/sensor/output', queryParameters: {
        'sensorid[]': ['kedaton', 'sukarame', 'rajabasa']
      });

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        setState(() {
          _dataList = data.map((item) {
            return {
              'id': item['id'],
              'sensorid': item['sensorid'],
              'water_level': item['water_level'],
              'lokasi': item['lokasi'],
              'latitude': item['latitude'],
              'longitude': item['longitude'],
              'kondisi': item['kondisi'],
              'created_at': item['created_at'],
              'icon': 'assets/icons/Redmarker.svg',
              'lokasi_text': 'Lokasi  : ${item['sensorid'].toUpperCase()}',
              'ketinggian_text': 'Ketinggian : ${item['water_level']} cm',
              'status_text': 'Status        : ${item['kondisi']}',
            };
          }).toList();
        });
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: _dataList.length,
      itemBuilder: (context, index) {
        final item = _dataList[index];
        return _listData(
          item['icon']!,
          item['lokasi_text']!,
          item['ketinggian_text']!,
          item['status_text']!,
          item, // Kirim seluruh data item
        );
      },
    );
  }

  Widget _listData(String icon, String text, String text2, String text3,
      Map<String, dynamic> data) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(3.0, 3.0),
            blurRadius: 1.0,
            spreadRadius: 1.0,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: kPrimaryColor,
          padding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: const Color(0xFFF5F6F9),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailDataBanjirPage(data: data),
            ),
          );
        },
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 40,
              height: 40,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    text2,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    text3,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 9,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
