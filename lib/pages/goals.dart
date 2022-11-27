import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:im_stepper/stepper.dart';
import 'package:myhealthcop/pages/reschedule.dart';

import '../bubbles/bubble_test.dart';
import '../bubbles/bubble_test.dart';

class WellnessGoals extends StatefulWidget {
  const WellnessGoals({Key? key}) : super(key: key);

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
            // appbar
            Row(children: [
              // Back button
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.arrow_back_rounded)),
              const Spacer(),
              // Page number
              Text((activeStep + 1).toString() + "/7"),
              const Spacer(),
              const Text("SKIP")
            ]),
            //
            DotStepper(
              activeStep: activeStep,
              dotCount: dotCount,
              dotRadius: MediaQuery.of(context).size.width * 0.055,
              shape: Shape.pipe,
              spacing: 10,
              tappingEnabled: true,
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
            // body of stepper
            Container(
              child: info(activeStep),
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
          shadowColor: const Color.fromARGB(100, 0, 169, 233),
          minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 55)),
      child: const Text('Next'),
      onPressed: () {
        if (activeStep < dotCount - 1) {
          setState(() {
            activeStep++;
          });
        } else
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ReschdulePage()));
      },
    );
  }

  /// Returns the previous button widget.
  Widget previousButton() {
    return ElevatedButton(
      child: const Text('Prev'),
      onPressed: () {
        if (activeStep > 0) {
          setState(() {
            activeStep--;
          });
        }
      },
    );
  }
}

// Pages in Stepper
Widget info(int page) {
  late List<Bbubble> selectedBubbles = [];
  void initState() {
    // super.initState();
    selectedBubbles;
  }

  switch (page) {
    case 1:
      return const Text('Page 2',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold));

    case 2:
      return const Text('Page 3',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold));

    case 3:
      return const Text('Page 4',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold));

    case 4:
      return const Text('Page 5',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold));

    case 5:
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("What are your \nwellness goals",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),

          //

          BubbleSelection(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            bubbless: [
              Bbubble(
                  text: "Eat Healthy",
                  scale: 0.9,
                  backgroundImage: const AssetImage("assets/images/medi.jpg"),
                  activeColor: Colors.red.withOpacity(0.5),
                  inactiveColor: Colors.blue.withOpacity(0.5),
                  textStyle: const TextStyle(
                    fontSize: 18,
                  )),
              Bbubble(
                scale: 0.9,
                text: "Define Your Goal",
                activeColor: Colors.red.withOpacity(0.5),
                inactiveColor:
                    const Color.fromARGB(255, 237, 141, 17).withOpacity(0.5),
                textStyle: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Bbubble(
                text: "Lose Weight",
                activeColor: Colors.red.withOpacity(0.5),
                inactiveColor:
                    const Color.fromARGB(255, 16, 233, 186).withOpacity(
                  0.5,
                ),
                scale: 0.9,
              ),
              Bbubble(
                scale: 0.9,
                backgroundImage: const AssetImage("assets/images/medi.jpg"),
                text: "Gain Weight",
                activeColor: Colors.red.withOpacity(0.5),
                inactiveColor:
                    const Color.fromARGB(255, 89, 37, 245).withOpacity(0.5),
                textStyle: const TextStyle(
                  fontSize: 18,
                ),
              ),
              Bbubble(
                scale: 0.9,
                text: "Be More Active",
                activeColor: Colors.red.withOpacity(0.5),
                inactiveColor:
                    const Color.fromARGB(255, 176, 34, 224).withOpacity(0.5),
              ),
              Bbubble(
                scale: 0.9,
                text: "Keep Fit",
                activeColor: Colors.red.withOpacity(0.5),
                inactiveColor:
                    const Color.fromARGB(255, 89, 37, 245).withOpacity(0.5),
              ),
              Bbubble(
                scale: 0.9,
                text: "ReduceStress",
                activeColor: Colors.red.withOpacity(0.5),
                inactiveColor:
                    const Color.fromARGB(255, 176, 34, 224).withOpacity(0.5),
              ),
            ],
            selectedBubbless: selectedBubbles,
            size: const Size(
              900,
              500,
            ),
            onSelect: (bubble) {
              setState() {
                selectedBubbles.add(bubble);
              }

              ;
            },
            onRemoved: (bubble) {
              setState() {
                selectedBubbles.remove(bubble);
              }

              ;
            },
          ),
        ],
      );

    case 6:
      return const Text('Page 7',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold));

    case 7:
      return const Text('Medical History',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold));

    // Here, default corresponds to the index value = 0.
    default:
      return const Text('Welcome',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold));
  }
}
