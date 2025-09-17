import 'package:flutter/material.dart';

class Experiment2Screen extends StatelessWidget {
  const Experiment2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experiment 2: Flutter Widgets'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Flutter Widgets Exploration',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            
            // Text Widget Demo
            _buildWidgetDemoCard(
              'Text Widget',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Simple Text'),
                  const Text('Bold Text', style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text('Colored Text', style: TextStyle(color: Colors.red)),
                  const Text('Large Text', style: TextStyle(fontSize: 20)),
                  Text('Styled Text', style: Theme.of(context).textTheme.headlineSmall),
                ],
              ),
            ),
            
            // Container Widget Demo
            _buildWidgetDemoCard(
              'Container Widget',
              Column(
                children: [
                  Container(
                    width: 100,
                    height: 50,
                    color: Colors.blue,
                    child: const Center(child: Text('Blue Box', style: TextStyle(color: Colors.white))),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 120,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.red, width: 2),
                    ),
                    child: const Center(child: Text('Styled Container')),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 140,
                    height: 50,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.purple, Colors.pink],
                      ),
                    ),
                    child: const Center(child: Text('Gradient Container', style: TextStyle(color: Colors.white))),
                  ),
                ],
              ),
            ),
            
            // Image Widget Demo
            _buildWidgetDemoCard(
              'Image Widget',
              Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.image,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text('Image Placeholder'),
                  const Text('(Using Icon as placeholder)', style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ),
            
            // Row Layout Demo
            _buildWidgetDemoCard(
              'Row Widget (Horizontal Layout)',
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.red,
                    child: const Center(child: Text('1', style: TextStyle(color: Colors.white))),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.green,
                    child: const Center(child: Text('2', style: TextStyle(color: Colors.white))),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.blue,
                    child: const Center(child: Text('3', style: TextStyle(color: Colors.white))),
                  ),
                ],
              ),
            ),
            
            // Column Layout Demo
            _buildWidgetDemoCard(
              'Column Widget (Vertical Layout)',
              Column(
                children: [
                  Container(
                    width: 80,
                    height: 30,
                    color: Colors.red,
                    child: const Center(child: Text('Top', style: TextStyle(color: Colors.white))),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: 80,
                    height: 30,
                    color: Colors.green,
                    child: const Center(child: Text('Middle', style: TextStyle(color: Colors.white))),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: 80,
                    height: 30,
                    color: Colors.blue,
                    child: const Center(child: Text('Bottom', style: TextStyle(color: Colors.white))),
                  ),
                ],
              ),
            ),
            
            // Stack Widget Demo
            _buildWidgetDemoCard(
              'Stack Widget (Overlapping Layout)',
              SizedBox(
                height: 150,
                child: Stack(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      color: Colors.red.withOpacity(0.7),
                    ),
                    Positioned(
                      left: 20,
                      top: 20,
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.green.withOpacity(0.7),
                      ),
                    ),
                    Positioned(
                      left: 40,
                      top: 40,
                      child: Container(
                        width: 80,
                        height: 80,
                        color: Colors.blue.withOpacity(0.7),
                        child: const Center(
                          child: Text('Stacked', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Complex Layout Demo
            _buildWidgetDemoCard(
              'Complex Layout Example',
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Icon(Icons.person, color: Colors.white),
                        ),
                        const SizedBox(width: 16),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Haswinchony', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              Text('Flutter Developer', style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text('This demonstrates a complex layout using multiple widgets combined together.'),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () => _showWidgetInfo(context),
                icon: const Icon(Icons.widgets),
                label: const Text('Widget Information'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
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

  Widget _buildWidgetDemoCard(String title, Widget child) {
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
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }

  void _showWidgetInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Flutter Widgets'),
        content: const Text(
          'Flutter widgets are the building blocks of Flutter applications:\n\n'
          '• Text: Display text with various styles\n'
          '• Container: A box model for styling and positioning\n'
          '• Image: Display images from assets or network\n'
          '• Row: Arrange children horizontally\n'
          '• Column: Arrange children vertically\n'
          '• Stack: Overlay widgets on top of each other\n\n'
          'These widgets can be combined to create complex UIs.',
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