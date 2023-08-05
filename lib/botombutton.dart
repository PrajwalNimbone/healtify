import 'package:flutter/material.dart';


class BottomButton extends StatelessWidget {
  BottomButton({required this.Buttontitle,required this.onTap});
  final VoidCallback onTap;
  final String Buttontitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.pink,
        margin: const EdgeInsets.all(10),
        width: double.infinity,
        height: 80.0,
        child:  Center(
            child: Text(
              Buttontitle,
              style: TextStyle(fontSize: 20),
            )),
      ),
    );
  }
}