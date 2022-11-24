import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:im_stepper/stepper.dart';
import 'package:myhealthcop/pages/reschedule.dart';

class WellnessGoals extends StatefulWidget {
  WellnessGoals({Key? key}) : super(key: key);

  @override
  State<WellnessGoals> createState() => _WellnessGoalsState();
}

class _WellnessGoalsState extends State<WellnessGoals> {
  int activeStep = 0, dotCount = 7;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              IconButton(
                  onPressed: () {
                    // TODO: REmove
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReschdulePage()));
                  },
                  icon: Icon(Icons.arrow_back_rounded)),
              Spacer(),
              Text("6/7"),
              Spacer(),
              Text("SKIP")
            ]),
            DotStepper(
              activeStep: activeStep,
              dotCount: dotCount,
              dotRadius: MediaQuery.of(context).size.width * 0.055,
              shape: Shape.pipe,
              spacing: 10,
              tappingEnabled: true,
              // ??
              indicator: Indicator.shift,
              fixedDotDecoration: const FixedDotDecoration(color: Colors.blue),
              indicatorDecoration: const IndicatorDecoration(
                  color: Color.fromARGB(255, 212, 208, 208)),
              onDotTapped: (tappedDotIndex) {
                setState(() {
                  activeStep = tappedDotIndex;
                });
              },
            ),
            Container(
              child: Text(
                info(activeStep),
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const Expanded(child: const SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [/* previousButton(), Spacer(), */ nextButton()],
            )
          ],
        ),
      )),
    );
  }

  Row steps() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(dotCount, (index) {
        return ElevatedButton(
          child: Text('${index + 1}'),
          onPressed: () {
            setState(() {
              activeStep = index;
            });
          },
        );
      }),
    );
  }

  /// Returns the next button widget.
  Widget nextButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 9,
          shadowColor: Color.fromARGB(100, 0, 169, 233),
          minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 55)),
      child: const Text('Next'),
      onPressed: () {
        /// ACTIVE STEP MUST BE CHECKED FOR (dotCount - 1) AND NOT FOR dotCount To PREVENT Overflow ERROR.
        if (activeStep < dotCount - 1) {
          setState(() {
            activeStep++;
          });
        }
      },
    );
  }

  /// Returns the previous button widget.
  Widget previousButton() {
    return ElevatedButton(
      child: const Text('Prev'),
      onPressed: () {
        // activeStep MUST BE GREATER THAN 0 TO PREVENT OVERFLOW.
        if (activeStep > 0) {
          setState(() {
            activeStep--;
          });
        }
      },
    );
  }
}

/* Row steps() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: List.generate(dotCount, (index) {
      return ElevatedButton(
        child: Text('${index + 1}'),
        onPressed: () {
          setState(() {
            activeStep = index;
          });
        },
      );
    }),
  );
} */

String info(int index) {
  switch (index) {
    case 1:
      return 'Page 2';

    case 2:
      return 'Page 3';

    case 3:
      return 'Page 4';

    case 4:
      return 'Page 5';

    case 5:
      return "What are your \nwellness goals";

    case 6:
      return 'Page 7';

    case 7:
      return 'Medical History';

    // Here, default corresponds to the index value = 0.
    default:
      return 'Welcome';
  }
}
