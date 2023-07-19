import 'dart:io';

void main() {
  Map<int, Map<String, dynamic>> students = {};

  while (true) {
    print('\nWelcome to Student Management System');
    print(' 1. Admin Panel');
    print(' 2. Student Panel');
    print(' 3. Exit');
    print('Please select any one number');

    int userSelect = int.parse(stdin.readLineSync()!);

    if (userSelect == 1) {
      adminPenal(students);
    } else if (userSelect == 2) {
      studentPenal();
    } else if (userSelect == 3) {
      exit();
    } else {
      print('Please choice a correct number');
    }
  }
}

void adminPenal(Map<int, Map<String, dynamic>> students) {
  // code for the admin panel here...

  while (true) {
    print('\nWelcome to Admin penal');
    print(' 1. Add student');
    print(' 2. display Student ');
    print(' 3. search');
    print(' 4. Remove student ');

    int userSelect = int.parse(stdin.readLineSync()!);

    if (userSelect == 1) {
      addStudent(students);
    } else if (userSelect == 2) {
      displayStudents(students);
    } else if (userSelect == 3) {
      searchStd(students);
    }
  }
}

void addStudent(Map<int, Map<String, dynamic>> addStudents) {
  print('Enter student details:');
  print('Roll No: ');

  int rollNo = int.parse(stdin.readLineSync()!);

  if (addStudents.containsKey(rollNo)) {
    print('Student with roll number $rollNo already exists!');
    return;
  }

  print('Name: ');
  String name = stdin.readLineSync()!;
  print('Marks: ');
  double marks = double.parse(stdin.readLineSync()!);

  addStudents[rollNo] = {'name': name, 'marks': marks};
  print('Student added successfully!');
}

void displayStudents(Map<int, Map<String, dynamic>> displayStudentsFunc) {
  print('Display Student');
  if (displayStudentsFunc.isEmpty) {
    print("There are no registered students");
  } else {
    displayStudentsFunc.forEach((rollNo, value) {
      print(
          'Roll No: $rollNo, Name: ${value['name']}, Marks: ${value['marks']}');
    });
  }
}

void searchStd(Map<int, Map<String, dynamic>> searchingStd) {
  print('Please enter student Roll No');

  int rollNo = int.parse(stdin.readLineSync()!);
  if (searchingStd.containsKey(rollNo)) {
    print('Student found:');
    print(
        'Roll No: $rollNo, Name: ${searchingStd[rollNo]!['name']}, Marks: ${searchingStd[rollNo]!['marks']}');
  } else {
    print('No Student Found');
  }
}

studentPenal() {}
exit() {}
