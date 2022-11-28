import 'package:animations/animations.dart';
import 'package:calender_picker/calender_picker.dart';
import 'package:flutter/material.dart';
import 'package:myhealthcop/pages/card_details.dart';

class ReschdulePage extends StatefulWidget {
  const ReschdulePage({Key? key}) : super(key: key);

  @override
  State<ReschdulePage> createState() => _ReschdulePageState();
}

class _ReschdulePageState extends State<ReschdulePage> {
  DateTime dateTime = DateTime.now();
  int intMonth = DateTime.now().month;
  bool isActive = false;

  int days = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Appbar
              Row(children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_rounded),
                  onPressed: () {
                    Navigator.pop(context);
                  },
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
                      padding: EdgeInsets.symmetric(vertical: 10),
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
                        // Gets and displays the month
                        Text(month(intMonth),
                            style: const TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold)),
                        const Expanded(child: SizedBox()),

                        // Previous month button
                        IconButton(
                            onPressed: () {
                              if (intMonth > 1) {
                                setState(() {
                                  intMonth--;
                                });
                              }
                            },
                            icon: const Icon(Icons.arrow_back_ios)),

                        // Next month button
                        IconButton(
                            onPressed: () {
                              if (intMonth < 12) {
                                setState(() {
                                  intMonth++;
                                });
                              }
                            },
                            icon: const Icon(Icons.arrow_forward_ios)),
                      ],
                    ),

                    // Horizontal calender_picker
                    CalenderPicker(
                      dateTime,
                      selectedTextColor: Colors.black,
                      daysCount: days,
                      enableMultiSelection: false,
                      selectionColor: const Color.fromARGB(255, 202, 208, 239),
                    ),

                    // View enlarged calender
                    OpenContainer(
                      closedElevation: 0,
                      closedColor: const Color.fromARGB(0, 9, 9, 9),
                      closedBuilder:
                          (BuildContext context, void Function() action) {
                        return const Center(
                          child: Icon(Icons.keyboard_arrow_down_outlined),
                        );
                      },
                      openBuilder: (BuildContext context,
                          void Function({Object? returnValue}) action) {
                        return SafeArea(
                          child: Container(
                            child: const Text("CALENDER"),
                          ),
                        );
                      },
                    ),
                    const Divider(
                      thickness: 3,
                    ),
                    const Text(
                      "Morning",
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),

                    // Time selection
                    Row(
                      children: [
                        timeSelection("09:00", false),
                        timeSelection("09:30", false),
                        timeSelection("10:00", false),
                        timeSelection("10:30", true),
                      ],
                    ),
                    const Text(
                      "Afternoon",
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        timeSelection("12:00", false),
                        timeSelection("13:00", false),
                        timeSelection("13:30", true),
                      ],
                    ),
                    const Text(
                      "Evening",
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        timeSelection("17:00", false),
                        timeSelection("18:30", false),
                        timeSelection("19:00", false),
                        timeSelection("19:30", true),
                      ],
                    ),

                    // Confirm Button
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CardDetails()));
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                elevation: 7,
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * 0.75,
                                    55),
                                primary:
                                    const Color.fromARGB(255, 0, 167, 233)),
                            child: const Text(
                              "CONFIRM",
                              style: TextStyle(fontSize: 20),
                            )),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  InkWell timeSelection(String text, bool isSelects) {
    return InkWell(
      child: Container(
        alignment: const Alignment(0, 0),
        width: MediaQuery.of(context).size.width * 0.18,
        margin: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            color: isSelect == false
                ? const Color.fromARGB(255, 244, 245, 251)
                : const Color.fromARGB(255, 212, 217, 245)),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            (text),
            style: const TextStyle(fontSize: 16), // Time
          ),
        ),
      ),
      onTap: () {
        setState(() {
          isSelect = isSelects;
        });
      },
    );
  }
}

Color timeColor(bool isActive) {
  if (isActive) {
    return const Color.fromARGB(255, 212, 217, 245);
  } else {
    return const Color.fromARGB(255, 235, 237, 250);
  }
}

class TimeWidget extends StatelessWidget {
  TimeWidget({
    Key? key,
    required this.text,
    required this.color,
    this.isActivee = true,
  }) : super(key: key);

  final String text;
  Color color = const Color.fromARGB(255, 212, 217, 245);
  bool isActivee;
  int? r, b, g;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.18,
        margin: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            color: timeColor(isActivee)),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                text, // Time
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        if (isActivee) {
          isActivee = false;
          color = const Color.fromARGB(255, 212, 217, 245);
        } else {
          isActivee = true;
          color = const Color.fromARGB(255, 244, 245, 251);
        }
      },
    );
  }
}

String month(int month) {
  switch (month) {
    case 1:
      return 'January';

    case 2:
      return 'Febuary';

    case 3:
      return 'March';

    case 4:
      return 'April';

    case 5:
      return "May";

    case 6:
      return 'June';
    case 7:
      return 'July';
    case 8:
      return 'August';
    case 9:
      return 'September';
    case 10:
      return 'October';
    case 11:
      return 'November';
    case 12:
      return 'December';
    default:
      return 'Month';
  }
}
