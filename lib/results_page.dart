import 'package:bmi/reusable_card.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'Your Result',
                        style: textStyleForTitleLabel,
                      ),
                    ),
                    Expanded(
                        child: ReusableCard(
                      color: activeCardColor,
                      cardChild: Column(),
                    )),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        color: containerBottomColor,
                        margin: const EdgeInsets.only(top: 10),
                        width: double.infinity,
                        height: bottomContainerHeight,
                        child: const Center(
                          child: Text(
                            'NEW CALCULATION',
                            style: textStyleForTitleLabel,
                          ),
                        ),
                      ),
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
