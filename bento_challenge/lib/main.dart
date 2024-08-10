import 'package:bento_challenge/core/design/ui_colors.dart';
import 'package:bento_challenge/navbar/bar.dart';
import 'package:bento_challenge/navbar/item.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: Container(
          color: Colors.blue,
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: UIColors.alabaster,
        activeColor: UIColors.shamrock,
        color: UIColors.fringyFlower,
        style: TabStyle.fixedCircle,
        elevation: 5,
        height: 80,
        curveSize: 130,
        top: -60,
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.map, title: 'Discovery'),
          TabItem(icon: Icons.store, title: 'Add'),
          TabItem(icon: Icons.message, title: 'Message'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        initialActiveIndex: 2,
        onTap: (int i) => print('click index=$i'),
      ),
    );
  }
}
