import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  Color accent = const Color.fromRGBO(26, 188, 156, 1);
  DateTime selectedDate = DateTime.now();

  int currentDateSelectedIndex = 0;
  ScrollController scrollController = ScrollController();

  List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  List<String> days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
          ),
          Column(
          children: [
            const SizedBox(height: 10.0),
            Container(
                height: 30,
                margin: const EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    text: months[selectedDate.month - 1],
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Color.fromRGBO(1, 9, 32, 1)),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' ${selectedDate.year.toString()}',
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(1, 9, 32, 1))),
                    ],
                  ),
                )),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                    height: 80,
                    child: SizedBox(
                        child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(width: 10);
                      },
                      itemCount: 365,
                      controller: scrollController,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              currentDateSelectedIndex = index;
                              selectedDate =
                                  DateTime.now().add(Duration(days: index));
                            });
                          },
                          child: Container(
                            height: 80,
                            width: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: currentDateSelectedIndex == index
                                    ? const Color.fromRGBO(1, 9, 32, 1)
                                    : Colors.transparent),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  DateTime.now()
                                      .add(Duration(days: index))
                                      .day
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: currentDateSelectedIndex == index
                                          ? accent
                                          : const Color.fromRGBO(1, 9, 32, 1)),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  days[DateTime.now()
                                              .add(Duration(days: index))
                                              .weekday -
                                          1]
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: currentDateSelectedIndex == index
                                          ? accent
                                          : const Color.fromRGBO(1, 9, 32, 1)),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ))),
              ),
            ),
          ],
        ),
      ]),
    ));
  }
}
