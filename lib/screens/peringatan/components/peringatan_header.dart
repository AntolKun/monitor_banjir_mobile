import 'package:flutter/material.dart';

class PeringatanHeader extends StatelessWidget {
  const PeringatanHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // const Expanded(child: SearchField()),
          // const SizedBox(width: 16),
          // IconBtnWithCounter(
          //   svgSrc: "assets/icons/Undo.svg",
          //   press: () => Navigator.pushNamed(context, CartScreen.routeName),
          // ),
        ],
      ),
    );
  }
}
