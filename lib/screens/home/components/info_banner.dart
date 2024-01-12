import 'package:flutter/material.dart';
import 'package:monitor_banjir/constants.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: SizedBox(
        height: 150,
        child: Column(
          children: [
            const Text.rich(
              TextSpan(
                text: "Banjir",
                style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
                  )
                )
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
                const Text(
                  "Bahaya"
                ),
              ],
            )
          ]
        ),
      )
    );
  }
}
