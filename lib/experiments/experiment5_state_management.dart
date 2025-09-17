import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/counter_provider.dart';

class Experiment5Screen extends StatelessWidget {
  const Experiment5Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experiment 5: State Management'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'State Management in Flutter',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            
            // Stateless vs Stateful
            _buildStateCard(
              'Stateless vs Stateful Widgets',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Stateless Widget Example:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const StatelessWidgetExample(),
                  const SizedBox(height: 16),
                  const Text(
                    'Stateful Widget Example:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const StatefulWidgetExample(),
                ],
              ),
            ),
            
            // Provider State Management
            _buildStateCard(
              'Provider State Management',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Global state managed with Provider:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  const ProviderExample(),
                ],
              ),
            ),
            
            // setState Demo
            _buildStateCard(
              'setState() Example',
              const SetStateExample(),
            ),
            
            // Form State Management
            _buildStateCard(
              'Form State Management',
              const FormStateExample(),
            ),
            
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () => _showStateInfo(context),
                icon: const Icon(Icons.info),
                label: const Text('State Management Guide'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
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

  Widget _buildStateCard(String title, Widget child) {
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
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }

  void _showStateInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('State Management'),
        content: const Text(
          'Flutter offers multiple ways to manage state:\n\n'
          '• StatelessWidget: No mutable state\n'
          '• StatefulWidget: Local state with setState()\n'
          '• Provider: Global state management\n'
          '• InheritedWidget: Share state down widget tree\n'
          '• Bloc/Cubit: Complex state management\n'
          '• Riverpod: Modern state management\n\n'
          'Choose the right approach based on your app\'s complexity.',
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

// Stateless Widget Example
class StatelessWidgetExample extends StatelessWidget {
  const StatelessWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue),
      ),
      child: const Column(
        children: [
          Icon(Icons.info, color: Colors.blue),
          SizedBox(height: 8),
          Text(
            'This is a StatelessWidget',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('It cannot change its state once built.'),
        ],
      ),
    );
  }
}

// Stateful Widget Example
class StatefulWidgetExample extends StatefulWidget {
  const StatefulWidgetExample({super.key});

  @override
  State<StatefulWidgetExample> createState() => _StatefulWidgetExampleState();
}

class _StatefulWidgetExampleState extends State<StatefulWidgetExample> {
  int _localCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green),
      ),
      child: Column(
        children: [
          const Icon(Icons.refresh, color: Colors.green),
          const SizedBox(height: 8),
          const Text(
            'This is a StatefulWidget',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('Local Counter: $_localCounter'),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => setState(() => _localCounter++),
            child: const Text('Increment Local Counter'),
          ),
        ],
      ),
    );
  }
}

// Provider Example
class ProviderExample extends StatelessWidget {
  const ProviderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.purple[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.purple),
      ),
      child: Column(
        children: [
          Consumer<CounterProvider>(
            builder: (context, counter, child) {
              return Column(
                children: [
                  const Icon(Icons.cloud, color: Colors.purple),
                  const SizedBox(height: 8),
                  const Text(
                    'Provider Counter (Global State)',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('Counter: ${counter.counter}'),
                  Text('Message: ${counter.message}'),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: counter.decrement,
                        child: const Text('-'),
                      ),
                      ElevatedButton(
                        onPressed: counter.increment,
                        child: const Text('+'),
                      ),
                      ElevatedButton(
                        onPressed: counter.reset,
                        child: const Text('Reset'),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

// setState Example
class SetStateExample extends StatefulWidget {
  const SetStateExample({super.key});

  @override
  State<SetStateExample> createState() => _SetStateExampleState();
}

class _SetStateExampleState extends State<SetStateExample> {
  String _selectedColor = 'Red';
  final List<String> _colors = ['Red', 'Blue', 'Green', 'Orange', 'Purple'];

  Color _getColor(String colorName) {
    switch (colorName) {
      case 'Red': return Colors.red;
      case 'Blue': return Colors.blue;
      case 'Green': return Colors.green;
      case 'Orange': return Colors.orange;
      case 'Purple': return Colors.purple;
      default: return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.orange),
      ),
      child: Column(
        children: [
          Icon(Icons.palette, color: _getColor(_selectedColor)),
          const SizedBox(height: 8),
          const Text(
            'setState() Color Changer',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('Selected Color: $_selectedColor'),
          const SizedBox(height: 12),
          DropdownButton<String>(
            value: _selectedColor,
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  _selectedColor = newValue;
                });
              }
            },
            items: _colors.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

// Form State Example
class FormStateExample extends StatefulWidget {
  const FormStateExample({super.key});

  @override
  State<FormStateExample> createState() => _FormStateExampleState();
}

class _FormStateExampleState extends State<FormStateExample> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  String _submittedData = '';

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _submittedData = 'Hello, ${_nameController.text}!';
      });
      
      // Also update Provider state
      context.read<CounterProvider>().updateMessage('Form updated: ${_nameController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.teal[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.teal),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const Icon(Icons.edit, color: Colors.teal),
            const SizedBox(height: 8),
            const Text(
              'Form State Management',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Enter your name',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text('Submit'),
            ),
            if (_submittedData.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text(
                _submittedData,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}