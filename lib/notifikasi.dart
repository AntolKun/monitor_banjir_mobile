import 'package:flutter/material.dart';

class Notifikasi extends StatefulWidget {
  const Notifikasi({Key? key}) : super(key: key);
  
  @override
  State<Notifikasi> createState() => _NotifikasiState();
}

class _NotifikasiState extends State<Notifikasi> {

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Notifikasi'),
    );
  }
}