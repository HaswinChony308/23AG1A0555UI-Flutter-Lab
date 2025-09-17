import 'package:flutter/material.dart';

class Experiment4Screen extends StatelessWidget {
  const Experiment4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experiment 4: Navigation'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Navigation in Flutter',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            
            // Basic Navigation
            _buildNavigationCard(
              'Basic Navigation',
              'Navigate to a new screen using Navigator.push',
              Icons.arrow_forward,
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BasicNavigationScreen()),
              ),
            ),
            
            // Named Routes
            _buildNavigationCard(
              'Named Routes',
              'Use named routes for better organization',
              Icons.route,
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NamedRoutesDemoScreen(),
                  settings: const RouteSettings(name: '/named-routes-demo'),
                ),
              ),
            ),
            
            // Passing Data
            _buildNavigationCard(
              'Passing Data',
              'Pass data between screens',
              Icons.send,
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DataPassingScreen(
                    title: 'Data from Experiment 4',
                    data: {
                      'student': 'Haswinchony',
                      'rollNo': '23AG1A0555',
                      'experiment': 4,
                    },
                  ),
                ),
              ),
            ),
            
            // Tab Navigation
            _buildNavigationCard(
              'Tab Navigation',
              'Navigate between tabs using TabBar',
              Icons.tab,
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TabNavigationScreen()),
              ),
            ),
            
            // Drawer Navigation
            _buildNavigationCard(
              'Drawer Navigation',
              'Side navigation drawer',
              Icons.menu,
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DrawerNavigationScreen()),
              ),
            ),
            
            // Bottom Navigation
            _buildNavigationCard(
              'Bottom Navigation',
              'Bottom tab navigation',
              Icons.navigation,
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BottomNavigationScreen()),
              ),
            ),
            
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () => _showNavigationInfo(context),
                icon: const Icon(Icons.info),
                label: const Text('Navigation Guide'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
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

  Widget _buildNavigationCard(String title, String description, IconData icon, VoidCallback onTap) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.teal,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }

  void _showNavigationInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Flutter Navigation'),
        content: const Text(
          'Flutter provides several navigation patterns:\n\n'
          '• Navigator.push/pop: Basic navigation\n'
          '• Named Routes: Organized route management\n'
          '• Data Passing: Send data between screens\n'
          '• TabBar: Tab-based navigation\n'
          '• Drawer: Side navigation menu\n'
          '• BottomNavigationBar: Bottom tabs\n\n'
          'Each pattern serves different use cases in mobile app navigation.',
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

// Basic Navigation Screen
class BasicNavigationScreen extends StatelessWidget {
  const BasicNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Navigation'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, size: 64, color: Colors.green),
              SizedBox(height: 16),
              Text(
                'Successfully Navigated!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'This screen was opened using Navigator.push()',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Named Routes Demo Screen
class NamedRoutesDemoScreen extends StatelessWidget {
  const NamedRoutesDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Named Routes Demo'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.route, size: 64, color: Colors.orange),
              SizedBox(height: 16),
              Text(
                'Named Routes Example',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'This demonstrates how to use named routes for better navigation organization.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Data Passing Screen
class DataPassingScreen extends StatelessWidget {
  final String title;
  final Map<String, dynamic> data;

  const DataPassingScreen({
    super.key,
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Passing'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Received Data:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title: $title',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    ...data.entries.map((entry) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text('${entry.key}: ${entry.value}'),
                    )),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'Data returned from DataPassingScreen');
              },
              child: const Text('Return Data'),
            ),
          ],
        ),
      ),
    );
  }
}

// Tab Navigation Screen
class TabNavigationScreen extends StatelessWidget {
  const TabNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tab Navigation'),
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.search), text: 'Search'),
              Tab(icon: Icon(Icons.person), text: 'Profile'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Home Tab', style: TextStyle(fontSize: 24))),
            Center(child: Text('Search Tab', style: TextStyle(fontSize: 24))),
            Center(child: Text('Profile Tab', style: TextStyle(fontSize: 24))),
          ],
        ),
      ),
    );
  }
}

// Drawer Navigation Screen
class DrawerNavigationScreen extends StatelessWidget {
  const DrawerNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer Navigation'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              child: Text(
                'Navigation Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          'Drawer Navigation Example\nTap the menu icon to open drawer',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

// Bottom Navigation Screen
class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Center(child: Text('Home Page', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Business Page', style: TextStyle(fontSize: 24))),
    const Center(child: Text('School Page', style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigation'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
      ),
    );
  }
}