import 'package:bento_challenge/core/design/ui_colors.dart';
import 'package:bento_challenge/core/design/ui_scale.dart';
import 'package:bento_challenge/root/navbar/bar.dart';
import 'package:bento_challenge/root/navbar/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RootView extends StatelessWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    UIScale.init(context);
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Container(
            color: Colors.blue,
            child: TextButton(
              onPressed: () {
                Modular.to.pushNamed('/product/details');
              },
              child: const Text('Go to Bar'),
            ),
          ),
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
