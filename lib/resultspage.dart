import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:healtify/Expandedcard.dart';
import 'package:healtify/botombutton.dart';
import 'package:healtify/constant.dart';

class ResultPage extends StatelessWidget {
  ResultPage({required this.bmiresult, required this.interpretation, required this.resultext});
  final String bmiresult;
  final String interpretation;
  final String resultext;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
            child: Text(
              'Your Result',
              style: knumbertextstyle,
            ),
            padding: EdgeInsets.all(15),
                alignment: Alignment.bottomLeft,
          )),
          Expanded(
              flex: 5,
              child: Expandedcard(
                colour: activecardcolour,
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultext.toUpperCase(),
                      style: TextStyle(fontSize: 25, color: Colors.green),
                    ),
                    Text(
                      bmiresult,
                      style: TextStyle(fontSize: 100.0, color: Colors.white,fontStyle:FontStyle.italic,fontWeight: FontWeight.w900),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        interpretation,
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                ),
              )),
          BottomButton(Buttontitle: 'RECALCULATE', onTap:(){
            Navigator.pop(context);
          })
        ],
      ),
    );
  }
}
