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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
      body: Stack(
        fit: StackFit.loose,
        children: [
        Positioned(
          width: MediaQuery.of(context).size.width,
          bottom: 350.0,
          child: const AlarmWidget(color: Colors.red, time: '10:00', title: 'Wake up')),
        Positioned(
          width: MediaQuery.of(context).size.width,
          bottom: 150.0,
          child: const AlarmWidget(color: Colors.green, time: '12:00', title: 'Lunch')),
        Positioned(
          width: MediaQuery.of(context).size.width,
          bottom: -50.0,
          child: const AlarmWidget(color: Colors.blue, time: '18:00', title: 'Dinner')),
      ]),
    );
  }
}
