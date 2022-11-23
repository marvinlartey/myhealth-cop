import 'package:flutter/material.dart';

class CardDetails extends StatelessWidget {
  const CardDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(children: [
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
              height: MediaQuery.of(context).size.height * 0.52,
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
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 33),
            child: Column(
              children: [
                Container(
                  color: Colors.transparent,
                  height: 222,
                ),
                Card(
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
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Row(
                              children: const [
                                Text("09:00 AM"),
                                VerticalDivider(
                                  width: 30,
                                  thickness: 15,
                                  indent: 20,
                                  endIndent: 0,
                                  color: Colors.red,
                                ),
                                Text("09:00 AM"),
                              ],
                            ),
                          ),
                          const Text(
                            "40 min",
                            style: TextStyle(color: Colors.grey),
                          ),
                          const Divider(
                            height: 20,
                            thickness: 2,
                          ),
                          Row(
                            children: const [
                              CircleAvatar(
                                radius: 22,
                                child: Image(
                                    image:
                                        AssetImage("assets/images/medi.jpg")),
                              )
                            ],
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
