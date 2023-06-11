import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String firstName, lastName;
  final double sliderValue;
  const SecondPage({Key? key, required this.firstName, required this.lastName, required this.sliderValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Witaj, $firstName $lastName'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, '/home');
              },
              child: const Text('Wróć do strony głównej'),
            ),
          ],
        ),
      ),
    );
  }
}
