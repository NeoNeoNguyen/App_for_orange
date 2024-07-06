// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APP FOR CAM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _buttonGhecTop = 200;
  double _buttonGhecLeft = 150;

  void _moveButton() {
    final random = Random();
    setState(() {
      _buttonGhecTop = random.nextDouble() * 400;
      _buttonGhecLeft = random.nextDouble() * 300;
    });
  }

  void _showMessage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Dialog(
          backgroundColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'CAM LÀ NHẤT',
                  style: TextStyle(
                    fontSize: 48,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black45,
                        offset: Offset(5.0, 5.0),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 48,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black45,
                      offset: Offset(5.0, 5.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: _showMessage,
                  child: const Text('Thích'),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Nhấn ở đây mới đúng!',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ),
          Positioned(
            top: _buttonGhecTop,
            left: _buttonGhecLeft,
            child: MouseRegion(
              onEnter: (_) => _moveButton(),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Ghéc'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
