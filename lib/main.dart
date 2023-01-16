import 'package:flutter/material.dart';
import 'constants.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF000000),
        colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xFF000000), secondary: Colors.red),
        //slider theme
        sliderTheme: const SliderThemeData(
          activeTrackColor: sliderColorActive,
          inactiveTrackColor: sliderColorInActive,
          thumbColor: thumbSliderColor,
          overlayColor: sliderOverlayColor,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 25),
          valueIndicatorShape: PaddleSliderValueIndicatorShape(),
          valueIndicatorColor: sliderValueColor,
        ),
      ),
      home: InputPage(),
    );
  }
}
