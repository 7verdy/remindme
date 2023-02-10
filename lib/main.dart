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
        scaffoldBackgroundColor: const Color.fromARGB(255, 1, 9, 32),
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
      body: Column(children: const [
        SizedBox(
          height: 200.0,
          child: Calendar()),
        SizedBox(
          height: 50.0,
          child: Center(
            child: Text(
              'Today',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
              ),
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
            const SizedBox(height: 50.0),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white,
                    splashRadius: 0.1,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'Add Reminder',
                      style: GoogleFonts.getFont('Yeseva One',
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                          )),
                    ),
                  ),
                ),
                // Center text
              ],
            ),
            const SizedBox(height: 60.0),
          ],
        ),
      ]),
    );
  }
}
