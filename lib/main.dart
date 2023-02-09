import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/alarm_widget.dart';


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
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
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
      body: Column(children: [
        const SizedBox(height: 50.0),
        Padding(
          padding: const EdgeInsets.only(right: 25.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.add),
                color: Colors.black,
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const AddReminderPage(),
                        transitionDuration: const Duration(milliseconds: 100),
                        transitionsBuilder: (context, animation, _, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ));
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 30.0),
        const SizedBox(
          child: Text(
            'tOdAy',
            style: TextStyle(
              color: Colors.white,
              fontSize: 50.0,
              fontFamily: 'Asgard',
              letterSpacing: 4.0,
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(children: const []),
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
        Container(
          height: MediaQuery.of(context).size.height,
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
            ),
          )
        ),
        Column(
          children: [
            const SizedBox(height: 50.0),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.black,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'Add Reminder',
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                  ),
                ),
                // Center text
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
