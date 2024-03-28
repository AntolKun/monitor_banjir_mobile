// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monitor_banjir/constants.dart';

class ListDarurat extends StatelessWidget {
  ListDarurat({
    Key? key,
  }) : super(key: key);
  String assetName = "assets/icons/png/marker.png";
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      children: [
        _listData(
            "assets/icons/police.svg",
            "Polisi",
            "No. Telp : 110",),
        _listData(
            "assets/icons/ambulance.svg",
            "Ambulans",
            "No. Telp : 8247737",),
        _listData(
            "assets/icons/firetruck.svg",
            "Pemadam Kebakaran",
            "No. Telp : 824737624737",),
        _listData(
            "assets/icons/bpbd.svg",
            "BPBD (Badan Penanggulangan Bencana Daerah)",
            "No. Telp : 110",),
      ],
    );
  }

  _listData(
    String icon,
    text,
    text2,
  ) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: const BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(
              3.0,
              3.0,
            ),
            blurRadius: 1.0,
            spreadRadius: 1.0,
          ), //BoxShadow
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
        onPressed: null,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 40,
              height: 40,
            ),
            const SizedBox(width: 40),
            Container(
              alignment: Alignment.center,
              // padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    width: 250,
                    child: Text(text,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                  ),
                  Text(text2,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 13)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
