import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


// ignore: must_be_immutable
class AlarmWidget extends StatefulWidget {
  const AlarmWidget(
      {super.key,
      required this.color,
      required this.time,
      required this.title});

  final Color color;
  final String time;
  final String title;

  @override
  AlarmSwitch createState() => AlarmSwitch();
}

class AlarmSwitch extends State<AlarmWidget> {
  bool isOn = true;
  late Color color;
  late String time;
  late String title;

  @override
  initState() {
    color = widget.color;
    time = widget.time;
    title = widget.title;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      decoration: BoxDecoration(
        color: color,
        // border top left and top right
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50.0),
          topRight: Radius.circular(50.0),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 25.0),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: Text(
                time,
                style: const TextStyle(
                  fontSize: 54,
                  color: Colors.white
                ),
              ),
            ),
          ),
          const SizedBox(height: 35.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Padding(padding:
              const EdgeInsets.only(left: 25.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 26,
                  color: Colors.white
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: Transform.scale(
                scale: 1.2,
                child: CupertinoSwitch(
                  // make the track blurry
                  trackColor: Colors.grey.withOpacity(0.5),
                  activeColor: Colors.white.withOpacity(0.7),
                  value: isOn,
                  onChanged: (value) {
                    setState(() {
                      isOn = value;
                    });
                  },
                  // add blur effect

                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
