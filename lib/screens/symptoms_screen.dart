import 'package:flutter/material.dart';

class SymptomsScreen extends StatefulWidget {
  const SymptomsScreen({Key? key}) : super(key: key);

  @override
  State<SymptomsScreen> createState() => _SymptomsScreenState();
}

class _SymptomsScreenState extends State<SymptomsScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text(
            "Symptoms",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
              fontFamily: 'Poppins',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 4,
                  shadowColor: Colors.blue,
                  child: SizedBox(
                    height: 250,
                    width: 150,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Image.asset("assets/images/shiver.png"),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('Runny Nose'),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Mucus draining or driping from the nostril',
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 4,
                  shadowColor: Colors.blue,
                  child: SizedBox(
                    height: 250,
                    width: 150,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Image.asset("assets/images/fever.png"),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('Fever'),
                          const SizedBox(
                            height: 7,
                          ),
                          const Text(
                            'A temperature that is higher than normal. Typically around 98.6F(37C)',
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 4,
                  shadowColor: Colors.blue,
                  child: SizedBox(
                    height: 250,
                    width: 150,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Image.asset("assets/images/cough.png"),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('Dry Cough'),
                          const SizedBox(
                            height: 7,
                          ),
                          const Text(
                            'A dry cough is a cough that doesnt bring up mucus',
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 4,
                  shadowColor: Colors.blue,
                  child: SizedBox(
                    height: 250,
                    width: 150,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Image.asset("assets/images/fatigue.png"),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('Fatigue'),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'You have no motivation, no energy, and overall feeling of tiredness',
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 4,
                  shadowColor: Colors.blue,
                  child: SizedBox(
                    height: 250,
                    width: 150,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Image.asset("assets/images/shiver.png"),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('Shiver'),
                          const SizedBox(
                            height: 7,
                          ),
                          const Text(
                            "It is body's natural response to getting colder",
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 4,
                  shadowColor: Colors.blue,
                  child: SizedBox(
                    height: 250,
                    width: 150,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Image.asset("assets/images/sneeze.png"),
                          const SizedBox(
                            height: 7,
                          ),
                          const Text('Fatigue'),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "Sneezing is your body's way of removing irritants from your nose",
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
