import 'package:flutter/material.dart';
import 'constants.dart';

class iconContent extends StatelessWidget {
  const iconContent(
      {required this.icon, required this.label, required this.color});

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: getIconColor(),
          size: 50,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: textStyleForLabel,
        )
      ],
    );
  }

  Color setIconColor({required Color color}) {
    return color;
  }

  Color getIconColor() {
    return color;
  }
}
