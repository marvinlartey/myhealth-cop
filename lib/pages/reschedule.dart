import 'package:animations/animations.dart';
import 'package:calender_picker/calender_picker.dart';
import 'package:flutter/material.dart';

class ReschdulePage extends StatefulWidget {
  ReschdulePage({Key? key}) : super(key: key);

  @override
  State<ReschdulePage> createState() => _ReschdulePageState();
}

class _ReschdulePageState extends State<ReschdulePage> {
  DateTime dateTime = DateTime.now();

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
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_back_ios)),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward_ios)),
                      ],
                    ),
                    OpenContainer(
                      closedBuilder:
                          (BuildContext context, void Function() action) {
                        return CalenderPicker(
                          dateTime,
                          selectedTextColor: Colors.black,
                          daysCount: days,
                          enableMultiSelection: false
                          /*  multiSelectionListener: (selectedDates) =>
                          print(selectedDates), */
                          ,
                          selectionColor:
                              const Color.fromARGB(255, 91, 128, 183),
                        );
                      },
                      openBuilder: (BuildContext context,
                          void Function({Object? returnValue}) action) {
                        return SafeArea(
                          child: Container(
                            child: const Text("open"),
                          ),
                        );
                      },
                    ),
                    const Center(
                      child: Icon(Icons.keyboard_arrow_down_outlined),
                    ),
                    const Divider(
                      thickness: 3,
                    ),
                    const Text(
                      "Morning",
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "CONFIRM",
                              style: TextStyle(fontSize: 20),
                            ),
                            style: ElevatedButton.styleFrom(
                                elevation: 7,
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * 0.75,
                                    55),
                                primary: Color.fromARGB(255, 0, 167, 233))),
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
            // style:
            //      isSelect == false
            //         ? widget.dateTextStyle
            //         : widget.activeDateStyle
          ),
        ),
      ),
      onTap: () {
        /* if (isSelect) {
          isSelect = !isSelect;
        } else {
          isSelect = true;
        } */
        setState(() {
          isSelect = isSelects;

          /* if (isSelect == true) {
                                list.add(widget.date.toString());
                                if (widget.onDateSelected != null) {
                                  // Call the onDateSelected Function
                                  widget.multiSelectionListener!(list);
                                }
                              } else {
                                list.remove(widget.date.toString());
                                // ignore: avoid_print
                                if (widget.onDateSelected != null) {
                                  // Call the onDateSelected Function
                                  widget.multiSelectionListener!(list);
                                }
                              } */
        });
        /* else {
                            // Check if onDateSelected is not null
                            if (widget.onDateSelected != null) {
                              // Call the onDateSelected Function
                              widget.onDateSelected!(widget.date);
                            }
                          } */
      },
    );
  }
}
