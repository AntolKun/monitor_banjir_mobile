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
      child: const SizedBox(
        height: 150,
        child: Row(
          children: [
            SizedBox(width: 30),
            Column(
              children: [
                Text.rich(
                  TextSpan(
                    text: "Banjir",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    )
                  )
                )
              ]
            ),
            SizedBox(width: 150),
            Column(children: [
              Text.rich(
                  TextSpan(
                    text: "Cuaca",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    )
                  )
                ),
              ],
            ),
            SizedBox(width: 30),
          ],
        )
      )
    );
  }
}
