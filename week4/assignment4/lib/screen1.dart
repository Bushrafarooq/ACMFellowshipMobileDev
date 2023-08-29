import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Screen1 extends StatelessWidget {
  final List<String> imageList = [
    'assets/image1.jpg',
    'assets/image2.jpg',
    'assets/img 3.png',
    // Add more image URLs here
  ];

  Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 1'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CarouselSlider(
              items: imageList.map((imageUrl) {
                return Image.network(imageUrl, fit: BoxFit.cover);
              }).toList(),
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
              ),
            ),
            SizedBox(height: 20.0),
            AnimatedProgressBar(),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Who is your favorite Anime character?',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedProgressBar extends StatefulWidget {
  const AnimatedProgressBar({super.key});

  @override
  _AnimatedProgressBarState createState() => _AnimatedProgressBarState();
}

class _AnimatedProgressBarState extends State<AnimatedProgressBar> {
  double _progressValue = 0.0;

  @override
  void initState() {
    super.initState();
    _animateProgress();
  }

  void _animateProgress() {
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _progressValue = 0.7; // Set your desired progress value here
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearProgressIndicator(
          value: _progressValue,
        ),
        SizedBox(height: 10.0),
        Text('Loading... ${(_progressValue * 100).toStringAsFixed(2)}%'),
      ],
    );
  }
}
