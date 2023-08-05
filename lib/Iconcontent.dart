import 'package:flutter/material.dart';
import 'package:healtify/constant.dart';


class Iconcontent extends StatelessWidget {
  const Iconcontent({super.key, this.icon,this.label});
  final IconData? icon;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80),
        const SizedBox(height: 15),
        Text(
          label ?? '', // Provide a default value for the label.
          style:klabeltextstyle,
        )
      ],
    );
  }
}
