//References for this exercise: dart.dev, Youtube, StackOverflow, course website, google, and other
import 'dart:convert';

class Students {
  List<Map<String, String>> people;
  Students(this.people);

  void arrange(String field) {
    people.sort((a, b) => a[field]!.compareTo(b[field]!));
  }

  void output() {
    for (var individual in people) {
      print(individual);
    }
  }

  void adding(Map<String, String> individual) {
    people.add(individual);
  }

  void remove(String field, String value) {
    people.removeWhere((individual) => individual[field] == value);
  }
}

void main() {
  String json = '''
  [
    {"first": "Michael", "last": "Brown", "email": "michael.brown@algonquincollege.com"},
    {"first": "Sarah", "last": "James", "email": "sarah.james@algonquincollege.com"},
    {"first": "David", "last": "Williams", "email": "david.williams@algonquincollege.com"},
    {"first": "Kevin", "last": "Thomas", "email": "kevin.thomas@algonquincollege.com"}
  ]
  ''';

  List<dynamic> decodedJson = jsonDecode(json);
  List<Map<String, String>> studentsList =
      decodedJson.map((e) => Map<String, String>.from(e)).toList();

  Students students = Students(studentsList);

  print('Initial List');
  students.output();

  print('Sort by last name');
  students.arrange('last');
  students.output();

// this line will add a new student to the list
  print('Add a new individual: Ahmed Wardhere');
  students.adding({
    "first": "Ahmed",
    "last": "Wardhere",
    "email": "ward0296@algonquinlive.com"
  });
  students.output();

  // this line will remove a student based on their first name
  print('Removing David Williams');
  students.remove('first', 'David');
  students.output();
}
