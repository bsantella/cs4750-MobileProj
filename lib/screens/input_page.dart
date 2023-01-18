import 'results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/bottom_button.dart';
import '../constants.dart';
import '../components/icon_content.dart';
import 'package:bmi/components/reusable_card.dart';
import '../components/round_icon_button.dart';
import 'package:bmi/calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  double cmHeight = 200;
  int kgWeight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI CALCULATOR',
          style: textStyleApp,
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          //male card
                          Expanded(
                            child: ReusableCard(
                              onPress: () {
                                setState(() {
                                  selectedGender = Gender.male;
                                });
                              },
                              colour: selectedGender == Gender.male
                                  ? activeCardColor
                                  : inactiveCardColor,
                              cardChild: iconContent(
                                  icon: FontAwesomeIcons.person,
                                  label: 'Male',
                                  color: selectedGender == Gender.male
                                      ? iconColorActive
                                      : iconColorInActive),
                            ),
                          ),
                          //female card
                          Expanded(
                            child: ReusableCard(
                                onPress: () {
                                  setState(() {
                                    selectedGender = Gender.female;
                                  });
                                },
                                colour: selectedGender == Gender.female
                                    ? activeCardColor
                                    : inactiveCardColor,
                                cardChild: iconContent(
                                    icon: FontAwesomeIcons.personDress,
                                    label: 'Female',
                                    color: selectedGender == Gender.female
                                        ? iconColorActive
                                        : iconColorInActive)),
                          ),
                        ],
                      ),
                    ),
                    //cmHeight card
                    Expanded(
                      child: ReusableCard(
                        colour: activeCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'HEIGHT (minimum 120 cm)',
                              style: textStyleForLabel,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  cmHeight.toString(),
                                  style: textStyleForNums,
                                ),
                                const Text(
                                  'cm',
                                  style: textStyleForLabel,
                                )
                              ],
                            ),
                            Slider(
                              value: cmHeight,
                              min: 120.0,
                              max: 280.0,
                              divisions: 280,
                              label: "$cmHeight",
                              onChanged: (double newValue) {
                                setState(() {
                                  cmHeight =
                                      double.parse(newValue.toStringAsFixed(1));
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: ReusableCard(
                              colour: activeCardColor,
                              cardChild: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'WEIGHT',
                                    style: textStyleForLabel,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        kgWeight.toString(),
                                        style: textStyleForNums,
                                      ),
                                      const Text('kg',
                                          style: textStyleForLabel),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RoundIconButton(
                                        icon: FontAwesomeIcons.minus,
                                        onPress: () {
                                          setState(() {
                                            kgWeight > 1 ? kgWeight-- : kgWeight = 1;
                                          });
                                        },
                                      ),
                                      const SizedBox(width: 30),
                                      RoundIconButton(
                                        icon: FontAwesomeIcons.plus,
                                        onPress: () {
                                          setState(() {
                                            kgWeight < 300
                                                ? kgWeight++
                                                : kgWeight = 300;
                                          });
                                        },
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: ReusableCard(
                              colour: activeCardColor,
                              cardChild: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'AGE',
                                    style: textStyleForLabel,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        age.toString(),
                                        style: textStyleForNums,
                                      ),
                                      const Text(
                                        'yrs',
                                        style: textStyleForLabel,
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RoundIconButton(
                                        icon: FontAwesomeIcons.minus,
                                        onPress: () {
                                          setState(() {
                                            age > 1 ? age-- : age = 1;
                                          });
                                        },
                                      ),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      RoundIconButton(
                                        icon: FontAwesomeIcons.plus,
                                        onPress: () {
                                          setState(() {
                                            age < 110 ? age++ : age = 110;
                                          });
                                        },
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    BottomButton(
                      buttonTitle: 'CALCULATE',
                      onTap: () {
                        CalculatorBrain calculate =
                            CalculatorBrain(cmHeight: cmHeight, kgWeight: kgWeight);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultsPage(
                                bmiResult: calculate.calculateBMI(),
                                resultText: calculate.getResult(),
                                analysis: calculate.getAnalysis()),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
