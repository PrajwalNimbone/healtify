import 'package:flutter/material.dart';

class Expandedcard extends StatelessWidget {

  const Expandedcard({super.key,  required this.colour, this.childCard,this.onPress});
  final  Color colour;
  final Widget? childCard;
  final  VoidCallback? onPress;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onPress,
      child: Container(
        child: childCard,
        margin: const EdgeInsets.all(15.0),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            color:  colour,
            borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}