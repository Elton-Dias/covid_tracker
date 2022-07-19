import 'package:covid_tracker/screens/tracker_screen.dart';
import 'package:flutter/material.dart';

class SliderSwitch extends StatefulWidget {
  const SliderSwitch({Key? key}) : super(key: key);

  @override
  State<SliderSwitch> createState() => _SliderSwitchState();
}

class _SliderSwitchState extends State<SliderSwitch> {
  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.green.withOpacity(.5),
        child: ToggleButtons(
          isSelected: isSelected,
          selectedColor: Colors.white,
          color: Colors.black,
          fillColor: Colors.lightBlue,
          renderBorder: false,
          highlightColor: Colors.orange,
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text("Tracker"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text("Symptoms"),
            )
          ],
          onPressed: (int newIndex) {
            setState(() {
              for (int index = 0; index < isSelected.length; index++) {
                if (index == newIndex) {
                  isSelected[index] = true;
                  print(index);
                  if (index == 0) {
                    const TrackerScreen();
                  } else {
                    print("Symptoms Screen");
                  }
                } else {
                  isSelected[index] = false;
                }
              }
            });
          },
        ),
      );
}
