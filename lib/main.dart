import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reminders/widgets/calendar.dart';

import 'widgets/calendar.dart';
import 'widgets/reminder_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RemindMe',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(26, 188, 156, 1),
        scaffoldBackgroundColor: Colors.transparent,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(26, 188, 156, 1),
                Color.fromRGBO(1, 9, 32, 1),
              ],
            ),
          ),
        ),
        Column(children: [
          const SizedBox(height: 180.0, child: Calendar()),
          const SizedBox(height: 30.0),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(1, 9, 32, 1),
                // border top left and top right
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Text(
                    'Today',
                    style: GoogleFonts.getFont('Yeseva One',
                        textStyle: const TextStyle(
                          color: Color.fromRGBO(26, 188, 156, 1),
                          fontSize: 30.0,
                        )),
                  ),
                ),
              ),
            ),
          ),
        ]),
        Positioned(
          bottom: 5.0,
          right: 5.0,
          child: CircleAvatar(
            radius: 30.0,
            backgroundColor: const Color.fromRGBO(26, 188, 156, 1),
            child: IconButton(
              icon: const Icon(Icons.add),
              color: const Color.fromRGBO(1, 9, 32, 1),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddReminderPage(),
                  ),
                );
              },
            ),
          ),
        ),
      ]),
    );
  }
}

class AddReminderPage extends StatelessWidget {
  const AddReminderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(1, 9, 32, 1),
                  ),
                ),
                Column(children: [
                  Stack(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, top: 42.0),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                        splashRadius: 0.1,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 55.0, top: 50.0),
                      child: Text(
                        'Add Reminder',
                        style: GoogleFonts.getFont('Yeseva One',
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 28.0,
                            )),
                      ),
                    ),
                  ]),
                ]),
                // Center text
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
