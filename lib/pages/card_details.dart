import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myhealthcop/pages/goals.dart';

class CardDetails extends StatelessWidget {
  const CardDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            // alignment: Alignment.topCenter,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/medi.jpg"),
                    fit: BoxFit.cover)),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            color: Colors.white,
            // alignment: Alignment.topCenter,
            /* decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/medi.jpg"),
                fit: BoxFit.cover)), */
          ),
        ],
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.transparent,
                height: 222,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 22, horizontal: 33),
                child: Card(
                    elevation: 15,
                    shadowColor: const Color.fromARGB(100, 0, 169, 233),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                color: const Color.fromARGB(255, 239, 218, 247),
                                child: const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    "Class",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 142, 68, 173)),
                                  ),
                                ),
                              ),
                              const Expanded(child: SizedBox()),
                              IconButton(
                                icon: const Icon(Icons.more_vert),
                                onPressed: (() {}),
                              )
                            ],
                          ),
                          const Text(
                            "Meditation",
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                          // Time and date row
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Row(
                              children: [
                                const Text("09:00 AM"),
                                const VerticalDivider(
                                  width: 30,
                                  thickness: 15,
                                  indent: 20,
                                  endIndent: 0,
                                  color: Colors.red,
                                ),
                                Text("Today, " +
                                    DateTime.now().day.toString() +
                                    " " +
                                    DateFormat.MMMM().format(DateTime.now())),
                              ],
                            ),
                          ),
                          // Length of the class
                          const Text(
                            "40 min",
                            style: TextStyle(color: Colors.grey),
                          ),
                          const Divider(
                            height: 20,
                            thickness: 2,
                          ),
                          // Name of the instructor
                          // TODO: change image to fit avatar
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 9),
                            child: Row(
                              children: const [
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/images/medi.jpg"),
                                  radius: 12,
                                  /* child: Image(
                                      image:
                                          AssetImage("assets/images/medi.jpg")), */
                                ),
                                Text(" Jane cooper")
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.videocam,
                                  color: Color.fromARGB(255, 183, 95, 220),
                                  size: 30,
                                ),
                                Text("Online")
                              ],
                            ),
                          ),
                          // Buttons
                          // TODO: round egdes
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 9),
                            child: Row(
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      elevation: 7,
                                      minimumSize: Size(
                                          MediaQuery.of(context).size.width *
                                              0.5,
                                          55),
                                    ),
                                    onPressed: () {
                                      // TODO: REMOVE
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  WellnessGoals()));
                                    },
                                    child: const Text("JOIN THE CLASS")),
                                const Expanded(child: SizedBox()),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      elevation: 7,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      minimumSize: Size(
                                          MediaQuery.of(context).size.width *
                                              0.2,
                                          55),
                                      primary: const Color.fromARGB(
                                          255, 205, 241, 255)),
                                  child: const Icon(Icons.chat_bubble_outline,
                                      color: Color.fromARGB(255, 0, 100, 167)),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
              ),
              Card(
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 22, bottom: 15),
                        child: Text(
                          "Overview",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Text(
                        "New to Fitness is program designed to get your activated on your fitness journey! ",
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/medi.jpg"),
                          ),
                          title: Text("Jane Cooper"),
                          subtitle: Text("Fitness Coach"),
                          trailing: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                      ),
                      const Text(
                        "Prepare for Online Class",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                          " * Keep in mind the following tips when preparing for your virtual session:"),
                      const Text(" You might have minimal workout space"),
                      const Text(
                          " * A full-length mirror isn’t particularly basic home gym equipment, but it can help you keep an eye on your form"),
                      const Text(
                          " * It’s great if you have a tripod so you can hook up your smartphone or tablet and easily move it around"),
                      const SizedBox(
                        height: 44,
                      ),
                      const Text(
                        "What You'll Need",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: const [
                          Card(
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                "Fitness mat",
                              ),
                            ),
                          ),
                          Card(
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                "Dumbbells 2 kg",
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 50,
                        thickness: 3,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          "List of Activities",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const BoldSText(
                        text: 'Consultation',
                      ),
                      const BoldSText(
                        text: 'Workout plan',
                      ),
                      const BoldSText(
                        text: 'Nutrition plan',
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 9),
                        child: Text(
                          "Contraindications",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const BoldSText(
                        text: 'Diabetic patients',
                      ),
                      const BoldSText(
                        text: 'Patients with heart problems',
                      ),
                      const Text(
                        "",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Sport Place",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      ListTile(
                        leading: IconButton(
                          color: const Color.fromARGB(255, 205, 241, 255),
                          padding: const EdgeInsets.all(0),
                          alignment: Alignment.centerLeft,
                          icon: const Icon(
                            Icons.videocam,
                            color: Color.fromARGB(255, 0, 162, 233),
                          ),
                          onPressed: () {},
                        ),
                        title: const Text("Online"),
                        subtitle: const Text(
                            "You can join the class at a specific time"),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ]);
  }
}

class BoldSText extends StatelessWidget {
  final String text;

  const BoldSText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
