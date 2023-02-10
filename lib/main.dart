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
          color: const Color.fromRGBO(60, 61, 83, 1),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: const [
            SizedBox(height: 50.0),
            Calendar(),
            SizedBox(height: 30.0),
          ]),
        ),
        Positioned(
          bottom: 10.0,
          right: 10.0,
          height: 40.0,
          width: 40.0,
          child: AspectRatio(
              aspectRatio: 1.0,
              child: FloatingActionButton(
                backgroundColor: const Color.fromRGBO(104, 104, 142, 1),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddReminderPage()),
                  );
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: const Icon(Icons.add, size: 25.0),
              )),
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
