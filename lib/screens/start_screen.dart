import 'package:covid_tracker/screens/home.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(
            flex: 1,
          ),
          Flexible(
            flex: 6,
            child: Image.asset('assets/images/startscreen.gif'),
          ),
          const Spacer(
            flex: 1,
          ),
          const Flexible(
            flex: 2,
            child: ListTile(
              title: Text(
                "Be aware\nStay healthy",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              subtitle: Text("Welcome to COVID-19 Information Portal"),
            ),
          ),
          const Spacer(flex: 4,),
          Flexible(
            flex: 2,
            fit: FlexFit.loose,
            child: Align(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => const HomePage(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                  ),
                  label: const Text("Get Started"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    surfaceTintColor: Colors.purple,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
