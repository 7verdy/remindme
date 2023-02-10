import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class Reminder {
  final String title;
  final String? description;
  final DateTime date;
  final String time;
  final int id;
  static List<Reminder> reminders = [];

  Reminder({required this.title, this.description, required this.date}) : id = const Uuid().v4().hashCode,
  time = '${date.hour}:${date.minute}';

  List<Reminder>? getRemindersFromDate() {
    if (Reminder.reminders.isEmpty) { return null; }

    final List<Reminder> reminders = [];
    for (final Reminder reminder in Reminder.reminders) {
      if (reminder.date.day == date.day &&
        reminder.date.month == date.month &&
        reminder.date.year == date.year) {
        reminders.add(reminder);
      }
    }
    return reminders;
  }

  void writeRemindersToFile() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File('${directory.path}/reminders.json');
    file.writeAsString(jsonEncode(Reminder.reminders));
  }
}