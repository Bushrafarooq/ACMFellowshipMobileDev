import 'package:flutter/material.dart';

void main() {
  runApp(RoadMapApp());
}

class RoadMapApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RoadMapScreen(),
    );
  }
}

class RoadMapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Week 3'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                color: Colors.purple,
                height: 100,
                child: Center(
                  child: Text(
                    'Container Widget',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.star),
                  Icon(Icons.circle_notifications),
                  Icon(Icons.circle_notifications),
                  Icon(Icons.circle_notifications),
                  Icon(Icons.star),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(color: Colors.pink, height: 50),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(color: Colors.purple, height: 50),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(color: Colors.red, height: 100, width: 100),
                  Icon(Icons.apple_rounded, size: 50),
                  Container(color: Colors.pink, height: 100, width: 100),
                  Icon(Icons.apple_rounded, size: 50),
                ],
              ),
              SizedBox(height: 20),
              CircleAvatar(
                radius: 100,
                backgroundColor: Colors.black,
                child: Text(
                  'Bushra',
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
              SizedBox(height: 20),
              Divider(
                color: Colors.grey,
                thickness: 2,
              ),
              SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  children: [
                    TextSpan(text: 'Rich'),
                    TextSpan(
                      text: 'Text',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: ' Widget'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter the text(this is a stateful widget)',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('List Tile'),
                subtitle: Text('Subtitle'),
                trailing: Icon(Icons.arrow_forward),
              ),
              SizedBox(height: 20),
              CounterWidget(), // Stateful Counter widget
              SizedBox(height: 40),
              Image.asset('assets/qd.png'),
              Text('Picture of Quaid e Azam'),
              SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ListTile(title: Text('Item $index'));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Counter Value: $_counter',
          style: TextStyle(fontSize: 25),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: _incrementCounter,
          child: Text('This is for counting'),
        ),
      ],
    );
  }
}
