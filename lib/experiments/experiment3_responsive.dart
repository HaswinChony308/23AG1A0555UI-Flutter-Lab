import 'package:flutter/material.dart';

class Experiment3Screen extends StatelessWidget {
  const Experiment3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isTablet = screenSize.width > 600;
    final isDesktop = screenSize.width > 1024;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Experiment 3: Responsive UI'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Responsive UI Design',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            
            // Screen Information
            _buildInfoCard(
              'Screen Information',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Width: ${screenSize.width.toStringAsFixed(0)}px'),
                  Text('Height: ${screenSize.height.toStringAsFixed(0)}px'),
                  Text('Device Type: ${_getDeviceType(screenSize.width)}'),
                  Text('Orientation: ${MediaQuery.of(context).orientation.name}'),
                  Text('Device Pixel Ratio: ${MediaQuery.of(context).devicePixelRatio.toStringAsFixed(2)}'),
                ],
              ),
            ),
            
            // Responsive Grid
            _buildInfoCard(
              'Responsive Grid Layout',
              _buildResponsiveGrid(context),
            ),
            
            // Breakpoint Demo
            _buildInfoCard(
              'Breakpoint Demonstration',
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: _getBreakpointColor(screenSize.width),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Icon(
                      _getBreakpointIcon(screenSize.width),
                      size: isDesktop ? 64 : isTablet ? 48 : 32,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _getDeviceType(screenSize.width),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isDesktop ? 24 : isTablet ? 20 : 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Adaptive Layout
            _buildInfoCard(
              'Adaptive Layout Example',
              _buildAdaptiveLayout(context),
            ),
            
            // Responsive Text
            _buildInfoCard(
              'Responsive Typography',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Responsive Heading',
                    style: TextStyle(
                      fontSize: isDesktop ? 28 : isTablet ? 24 : 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'This text adapts its size based on screen breakpoints. '
                    'On desktop it\'s larger, on tablet it\'s medium, and on mobile it\'s smaller.',
                    style: TextStyle(
                      fontSize: isDesktop ? 16 : isTablet ? 14 : 12,
                    ),
                  ),
                ],
              ),
            ),
            
            // Flexible Layout
            _buildInfoCard(
              'Flexible Layout with Flex',
              _buildFlexibleLayout(context),
            ),
            
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () => _showResponsiveInfo(context),
                icon: const Icon(Icons.phone_android),
                label: const Text('Responsive Design Info'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
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

  Widget _buildInfoCard(String title, Widget child) {
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
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildResponsiveGrid(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount;
    double childAspectRatio;

    if (screenWidth > 1024) {
      crossAxisCount = 4;
      childAspectRatio = 1.2;
    } else if (screenWidth > 600) {
      crossAxisCount = 3;
      childAspectRatio = 1.1;
    } else {
      crossAxisCount = 2;
      childAspectRatio = 1.0;
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: 8,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.blue[(index % 9 + 1) * 100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAdaptiveLayout(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    if (screenWidth > 600) {
      // Tablet/Desktop layout - horizontal
      return Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.purple[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(child: Text('Main Content')),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 1,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.purple[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(child: Text('Sidebar')),
            ),
          ),
        ],
      );
    } else {
      // Mobile layout - vertical
      return Column(
        children: [
          Container(
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.purple[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(child: Text('Main Content')),
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.purple[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(child: Text('Sidebar')),
          ),
        ],
      );
    }
  }

  Widget _buildFlexibleLayout(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.green[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(child: Text('Flex: 2')),
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          flex: 1,
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.green[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(child: Text('Flex: 1')),
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          flex: 3,
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.green[400],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(child: Text('Flex: 3')),
          ),
        ),
      ],
    );
  }

  String _getDeviceType(double width) {
    if (width > 1024) return 'Desktop';
    if (width > 600) return 'Tablet';
    return 'Mobile';
  }

  Color _getBreakpointColor(double width) {
    if (width > 1024) return Colors.green;
    if (width > 600) return Colors.orange;
    return Colors.red;
  }

  IconData _getBreakpointIcon(double width) {
    if (width > 1024) return Icons.desktop_windows;
    if (width > 600) return Icons.tablet;
    return Icons.phone_android;
  }

  void _showResponsiveInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Responsive Design'),
        content: const Text(
          'Responsive design ensures your app looks great on all devices:\n\n'
          '• MediaQuery: Get screen information\n'
          '• Breakpoints: Different layouts for different screen sizes\n'
          '• Flexible/Expanded: Widgets that adapt to available space\n'
          '• GridView: Responsive grid layouts\n'
          '• Adaptive layouts: Different UI structures per device\n\n'
          'Breakpoints used:\n'
          '• Mobile: < 600px\n'
          '• Tablet: 600px - 1024px\n'
          '• Desktop: > 1024px',
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