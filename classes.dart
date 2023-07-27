import 'dart:core';
import 'dart:io';

void main() {
  // Get the current date and time
  DateTime now = DateTime.now();

  // Set a specific time (e.g., 3:30 PM)
  DateTime specificTime = DateTime(now.year, now.month, now.day, 15, 30);

  print('Current Date and Time: $now');
  print('Specific Time: $specificTime');

  int rows = 5;
  String rowString = ' ';

  for (var i = 0; i < rows; i++) {
    stdout.write('${rowString * (rows - i)}');
    for (var j = 0; j <= i; j++) {
      stdout.write('* ');
    }
    print('');
  }
}
