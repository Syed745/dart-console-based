import 'dart:io';

void main() {
  bool isAuth = false;
  String userName = 'admin';
  String password = 'admin123';

  print('Enter your username:');
  String inputUsername = stdin.readLineSync()!;
  print('Enter your password:');
  String inputPassword = stdin.readLineSync()!;

  if (inputUsername == userName && inputPassword == password) {
    isAuth = true;
  } else {
    print('Invalid credentials. Exiting...');
    return;
  }

  Map<int, Map<String, dynamic>> students = {};

  while (true) {
    print('\nWelcome to Student Management System');
    print(' 1. Admin Panel');
    print(' 2. Student Panel');
    print(' 3. Exit');
    print('Please select any one number');

    int userSelect = int.parse(stdin.readLineSync()!);

    if (userSelect == 1) {
      if (isAuth) {
        adminPenal(students);
      }
    } else if (userSelect == 2) {
      studentPenal(students);
    } else if (userSelect == 3) {
      return;
    } else {
      print('Please choose a correct number');
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
    print(' 5. return for main menu ');
    print(' 6. Update student if you want');
    print('Please select any one number');

    int userSelect = int.parse(stdin.readLineSync()!);

    if (userSelect == 1) {
      addStudent(students);
    } else if (userSelect == 2) {
      displayStudents(students);
    } else if (userSelect == 3) {
      searchStd(students);
    } else if (userSelect == 4) {
      removeStudent(students);
    } else if (userSelect == 5) {
      main();
    } else if (userSelect == 6) {
      updateFunc(students);
    }
  }
}

/// Student Add Function ///

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

  addStudents[rollNo] = {
    'name': name,
    'marks': marks,
  };
  print('Student added successfully!');
}

/// Student Display Function ///

void displayStudents(Map<int, Map<String, dynamic>> displayStudentsFunc) {
  print('Display Student');
  if (displayStudentsFunc.isEmpty) {
    print("There are no registered students");
  } else {
    displayStudentsFunc.forEach((rollNo, value) {
      double marks = value['marks'];
      String grade = calculateGrade(marks);
      print(
          'Roll No: $rollNo, Name: ${value['name']}, Marks: $marks, Grade: $grade');
    });
  }
}

/// Student Search by id Function ///

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

/// Student portal ///

void studentPenal(Map<int, Map<String, dynamic>> studentPenalFunc) {
  while (true) {
    print('Welcome to student penal');
    print('1: Display Student');
    print('2: Search Student');
    print('3: Exit ');
    print('Please select any one number');

    int userSelect = int.parse(stdin.readLineSync()!);
    if (userSelect == 1) {
      displayStudents(studentPenalFunc);
    } else if (userSelect == 2) {
      searchStd(studentPenalFunc);
    } else if (userSelect == 3) {
      return;
    }
  }
}

// remove student //

void removeStudent(Map<int, Map<String, dynamic>> removeStd) {
  print('remove Student');
  print('enter Student ID for removing student');

  int userSelect = int.parse(stdin.readLineSync()!);

  if (removeStd.containsKey(userSelect)) {
    removeStd.remove(userSelect);
    print('Student remove successfully');
  } else {
    print('Student not found');
  }
}

// update Func //

void updateFunc(Map<int, Map<String, dynamic>> updateStd) {
  print('If you want to update student please enter Student ID');

  int id = int.parse(stdin.readLineSync()!);

  if (updateStd.containsKey(id)) {
    print('Enter Update Roll no');
    int updId = int.parse(stdin.readLineSync()!);

    print('Enter Updated Name');
    String nameUpd = stdin.readLineSync()!;

    print('Updated marks');
    double marks = double.parse(stdin.readLineSync()!);

    updateStd[id] = {'rollNo': updId, 'name': nameUpd, 'marks': marks};
    print('User Edit successfully');
  } else {
    print('Student not fount');
  }
}

// Marks Func //

String calculateGrade(double marks) {
  if (marks >= 90) {
    return 'A+';
  } else if (marks >= 80) {
    return 'A';
  } else if (marks >= 70) {
    return 'B';
  } else if (marks >= 60) {
    return 'C';
  } else if (marks >= 50) {
    return 'D';
  } else {
    return 'F';
  }
}
