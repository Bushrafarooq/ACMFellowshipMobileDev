import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  int _counter = 0;
  bool _isExpanded = false;

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _toggleExpansion,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: _isExpanded ? 200.0 : 50.0,
                height: _isExpanded ? 200.0 : 50.0,
                color: Colors.purpleAccent,
                child: Center(
                  child: Text(
                    '$_counter',
                    style: TextStyle(fontSize: 24.0, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary:
                    const Color.fromARGB(255, 218, 6, 255), // Background color
              ),
              child: const Text(
                'This is an animation. Tap on the Box to See magic',
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
