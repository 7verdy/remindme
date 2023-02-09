import 'package:flutter/material.dart';
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
                onPressed: () {},
              ),
            ),
          ),
        ),
        const SizedBox(height: 30.0),
        const SizedBox(child:
          Text('tOdAy',
          style: TextStyle(
            color: Colors.white,
            fontSize: 50.0,
            fontFamily: 'Asgard',
            letterSpacing: 4.0,
          ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(fit: StackFit.loose, children: [
              Positioned(
                  width: MediaQuery.of(context).size.width,
                  bottom: 550.0,
                  child: const AlarmWidget(
                      color: Colors.red, time: '10:00', title: 'Wake up')),
              Positioned(
                  width: MediaQuery.of(context).size.width,
                  bottom: 350.0,
                  child: const AlarmWidget(
                      color: Colors.green, time: '12:00', title: 'Lunch')),
              Positioned(
                  width: MediaQuery.of(context).size.width,
                  bottom: 150.0,
                  child: const AlarmWidget(
                      color: Colors.blue, time: '18:00', title: 'Dinner')),
            ]),
          ),
      ]),
    );
  }
}
