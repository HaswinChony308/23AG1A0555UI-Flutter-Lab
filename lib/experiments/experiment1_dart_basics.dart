import 'package:flutter/material.dart';

class Experiment1Screen extends StatelessWidget {
  const Experiment1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experiment 1: Dart Basics'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Dart Language Fundamentals',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            
            // Variables Demo
            _buildSectionCard(
              'Variables & Data Types',
              [
                'String name = "${DartBasics.studentName}";',
                'int age = ${DartBasics.age};',
                'double height = ${DartBasics.height};',
                'bool isStudent = ${DartBasics.isStudent};',
                'List<String> hobbies = ${DartBasics.hobbies};',
              ],
            ),
            
            // Functions Demo
            _buildSectionCard(
              'Functions',
              [
                'Addition: ${DartBasics.add(10, 5)} = ${DartBasics.add(10, 5)}',
                'Greeting: ${DartBasics.greetUser("Flutter Developer")}',
                'Is Even: ${DartBasics.isEven(4)} = ${DartBasics.isEven(4)}',
              ],
            ),
            
            // Control Flow Demo
            _buildSectionCard(
              'Control Flow',
              [
                'Numbers 1-5: ${DartBasics.getNumbers()}',
                'Grade for 85%: ${DartBasics.getGrade(85)}',
                'Grade for 75%: ${DartBasics.getGrade(75)}',
                'Grade for 60%: ${DartBasics.getGrade(60)}',
              ],
            ),
            
            // OOP Demo
            _buildSectionCard(
              'Object-Oriented Programming',
              [
                'Student: ${DartBasics.student.toString()}',
                'Teacher: ${DartBasics.teacher.toString()}',
              ],
            ),
            
            // Collections Demo
            _buildSectionCard(
              'Collections',
              [
                'Doubled Numbers: ${DartBasics.doubleNumbers([1, 2, 3, 4, 5])}',
                'Filtered (>3): ${DartBasics.filterNumbers([1, 2, 3, 4, 5, 6])}',
                'Sum of [1,2,3,4,5]: ${DartBasics.sumNumbers([1, 2, 3, 4, 5])}',
              ],
            ),
            
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () => _showDartInfo(context),
                icon: const Icon(Icons.info),
                label: const Text('About Dart & Flutter'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard(String title, List<String> content) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 10),
            ...content.map((item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Text(
                item,
                style: const TextStyle(fontSize: 14, fontFamily: 'monospace'),
              ),
            )),
          ],
        ),
      ),
    );
  }

  void _showDartInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Dart & Flutter Info'),
        content: const Text(
          'Dart is a client-optimized programming language developed by Google. '
          'Flutter uses Dart to build natively compiled applications for mobile, '
          'web, and desktop from a single codebase.\n\n'
          'Key Features:\n'
          '• Object-oriented\n'
          '• Type-safe\n'
          '• Garbage collected\n'
          '• Supports async/await\n'
          '• Hot reload development',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

// Dart Basics Class - Demonstrates core Dart concepts
class DartBasics {
  // Variables and Data Types
  static String studentName = "Haswinchony";
  static int age = 20;
  static double height = 5.9;
  static bool isStudent = true;
  static List<String> hobbies = ['Reading', 'Coding', 'Gaming'];
  
  // Objects
  static Student student = Student("Alice", 22, "Computer Science");
  static Teacher teacher = Teacher("Dr. Smith", "Flutter Development");

  // Functions
  static int add(int a, int b) => a + b;
  
  static String greetUser(String name) {
    return "Hello, $name! Welcome to Dart programming.";
  }
  
  static bool isEven(int number) => number % 2 == 0;

  // Control Flow
  static String getNumbers() {
    String result = "";
    for (int i = 1; i <= 5; i++) {
      result += i.toString();
      if (i < 5) result += ", ";
    }
    return result;
  }
  
  static String getGrade(int marks) {
    if (marks >= 80) {
      return "A Grade";
    } else if (marks >= 70) {
      return "B Grade";
    } else if (marks >= 60) {
      return "C Grade";
    } else {
      return "D Grade";
    }
  }

  // Collections and Higher-order functions
  static List<int> doubleNumbers(List<int> numbers) {
    return numbers.map((n) => n * 2).toList();
  }
  
  static List<int> filterNumbers(List<int> numbers) {
    return numbers.where((n) => n > 3).toList();
  }
  
  static int sumNumbers(List<int> numbers) {
    return numbers.fold(0, (sum, n) => sum + n);
  }
}

// Class definitions for OOP demonstration
class Person {
  String name;
  int age;
  
  Person(this.name, this.age);
  
  @override
  String toString() => "$name (Age: $age)";
}

class Student extends Person {
  String course;
  
  Student(super.name, super.age, this.course);
  
  @override
  String toString() => "${super.toString()}, Course: $course";
}

class Teacher {
  String name;
  String subject;
  
  Teacher(this.name, this.subject);
  
  @override
  String toString() => "Teacher: $name, Subject: $subject";
}