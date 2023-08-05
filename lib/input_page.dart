import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healtify/CalculatorBrain.dart';
import 'package:healtify/Expandedcard.dart';
import 'package:healtify/Iconcontent.dart';
import 'package:healtify/resultspage.dart';
import 'package:healtify/botombutton.dart';
import 'constant.dart';
import 'package:healtify/roundediconbutton.dart';

enum Gender { male, female }

class Inputpage extends StatefulWidget {
  const Inputpage({Key? key}) : super(key: key);
  @override
  State<Inputpage> createState() => _InputpageState();
}

class _InputpageState extends State<Inputpage> {
  // Color malecardclour = activecardcolour;
  // Color femalecardcolour = activecardcolour;
  Gender? selectedgender;
  int height = 150;
  int weight = 50;
  int age = 24;
  // void updateColour(Gender gender) {
  //   setState(() {
  //     if (gender == Gender.male) {
  //       malecardclour = inactivecardcolour;
  //       femalecardcolour = activecardcolour;
  //     } else if (gender == Gender.female) {
  //       femalecardcolour = inactivecardcolour;
  //       malecardclour = activecardcolour;
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Healtify'),
          ),
          backgroundColor: const Color(0xFF0A0E40),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Expandedcard(
                      onPress: () {
                        setState(() {
                          selectedgender = Gender.male;
                        });
                      },
                      colour: selectedgender == Gender.male
                          ? inactivecardcolour
                          : activecardcolour,
                      childCard: const Iconcontent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: Expandedcard(
                      onPress: () {
                        setState(() {
                          selectedgender = Gender.female;
                        });
                      },
                      colour: selectedgender == Gender.female
                          ? inactivecardcolour
                          : activecardcolour,
                      childCard: const Iconcontent(
                        icon: FontAwesomeIcons.venus,
                        label: "FEMALE",
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: Container(
              decoration: Sliderbox,
              child: Expandedcard(
                colour: activecardcolour,
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: klabeltextstyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: knumbertextstyle),
                        const Text(
                          'cm',
                          style: klabeltextstyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.grey,
                        thumbColor: Colors.redAccent,
                        overlayColor: Color(0x36EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Expandedcard(
                      colour: activecardcolour,
                      childCard: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: klabeltextstyle,
                          ),
                          Text(
                            weight.toString(),
                            style: knumbertextstyle,
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundedIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  }),
                              SizedBox(width: 10),
                              RoundedIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  })
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: Expandedcard(
                    colour: activecardcolour,
                    childCard: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: klabeltextstyle,
                          ),
                          Text(
                            age.toString(),
                            style: knumbertextstyle,
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundedIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  }),
                              SizedBox(width: 10,),
                              RoundedIconButton(icon: FontAwesomeIcons.plus, onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },)
                            ],

                          ),
                        ]),
                  ))
                ],
              ),
            ),
            BottomButton(
              Buttontitle: 'CALCULATE',
              onTap: (){
                Calculatorbrain calc = Calculatorbrain(weight: weight, height: height);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(
                  bmiresult: calc.calculateBmi(),
                  interpretation: calc.getinterpretation(),
                  resultext: calc.getresult(),
                )));
              },
            )
          ],
        ));
  }
}
