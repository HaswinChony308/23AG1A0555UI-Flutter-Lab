import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'experiments/experiment1_dart_basics.dart';
import 'experiments/experiment2_widgets.dart';
import 'experiments/experiment3_responsive.dart';
import 'experiments/experiment4_navigation.dart';
import 'experiments/experiment5_state_management.dart';
import 'providers/counter_provider.dart';

void main() {
  runApp(const FlutterExperimentsApp());
}

class FlutterExperimentsApp extends StatelessWidget {
  const FlutterExperimentsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider()),
      ],
      child: MaterialApp(
        title: 'UI Flutter Lab - Haswinchony (23AG1A0555)',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const ExperimentsListScreen(),
        routes: {
          '/experiment1': (context) => const Experiment1Screen(),
          '/experiment2': (context) => const Experiment2Screen(),
          '/experiment3': (context) => const Experiment3Screen(),
          '/experiment4': (context) => const Experiment4Screen(),
          '/experiment5': (context) => const Experiment5Screen(),
        },
      ),
    );
  }
}

class ExperimentsListScreen extends StatelessWidget {
  const ExperimentsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Flutter Lab - Haswinchony'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.lightBlueAccent],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const Card(
              margin: EdgeInsets.all(16.0),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Student: Haswinchony',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                      'Roll No: 23AG1A0555',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'UI Flutter Design Lab Experiments',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            _buildExperimentCard(
              context,
              'Experiment 1: Flutter & Dart SDK Basics',
              'Learn Dart language fundamentals and Flutter setup',
              Icons.code,
              '/experiment1',
            ),
            _buildExperimentCard(
              context,
              'Experiment 2: Flutter Widgets',
              'Explore Text, Image, Container, Row, Column, Stack widgets',
              Icons.widgets,
              '/experiment2',
            ),
            _buildExperimentCard(
              context,
              'Experiment 3: Responsive UI Design',
              'Create responsive UI with media queries and breakpoints',
              Icons.phone_android,
              '/experiment3',
            ),
            _buildExperimentCard(
              context,
              'Experiment 4: Navigation',
              'Implement navigation between screens with named routes',
              Icons.navigation,
              '/experiment4',
            ),
            _buildExperimentCard(
              context,
              'Experiment 5: State Management',
              'Learn stateful/stateless widgets, setState, and Provider',
              Icons.settings,
              '/experiment5',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExperimentCard(BuildContext context, String title, String description, IconData icon, String route) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () => Navigator.pushNamed(context, route),
      ),
    );
  }
}