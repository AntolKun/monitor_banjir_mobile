import 'package:flutter/material.dart';
import 'package:monitor_banjir/constants.dart';

// import 'components/categories.dart';
import 'components/info_banner.dart';
import 'components/peringatan_header.dart';
// import 'components/popular_product.dart';
import 'components/special_offers.dart';
import 'components/weather.dart';


class PeringatanScreen extends StatelessWidget {
  static String routeName = "/peringatan";

  const PeringatanScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: kPrimaryColorSoft,
        shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(15),
        ),
      ),
        title: const Text("Peringatan", style: TextStyle(fontSize: 20),),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              HomeHeader(),
              DiscountBanner(),
              // Categories(),
              // SpecialOffers(),
              SizedBox(height: 40),
              WeatherPage(),
              // PopularProducts(),
              // SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
