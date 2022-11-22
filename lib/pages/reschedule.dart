import 'package:animations/animations.dart';
import 'package:calender_picker/calender_picker.dart';
import 'package:flutter/material.dart';

class ReschdulePage extends StatelessWidget {
  ReschdulePage({Key? key}) : super(key: key);

  DateTime dateTime = DateTime.now();
  int days = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_rounded),
                  onPressed: () {},
                ),
                const Center(
                  heightFactor: 0,
                  widthFactor: 2.5,
                  child: Text(
                    'Reschedule',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                  ),
                )
              ]),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text("Meditation",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 24)),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Choose the most suitable day and time among the available ones",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Row(
                      children: [
                        const Text("December",
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold)),
                        const Expanded(child: SizedBox()),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_forward_ios)),
                      ],
                    ),
                    OpenContainer(
                      closedBuilder:
                          (BuildContext context, void Function() action) {
                        return Container(
                            child: CalenderPicker(
                          dateTime,
                          daysCount: days,
                          enableMultiSelection: true,
                          multiSelectionListener: (selectedDates) =>
                              print(selectedDates),
                          selectionColor: Color.fromARGB(255, 91, 128, 183),
                        )

                            /* Row(children: [
                            Column(
                              children: [
                                Text(
                                  "Mon",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "4",
                                  style: TextStyle(fontStyle: FontStyle.normal),
                                )
                              ],
                            )
                          ]), */
                            );
                      },
                      openBuilder: (BuildContext context,
                          void Function({Object? returnValue}) action) {
                        return SafeArea(
                          child: Container(
                            child: Text("open"),
                          ),
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
