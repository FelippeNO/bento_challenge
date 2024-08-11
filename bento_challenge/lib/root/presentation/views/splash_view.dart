import 'dart:async';

import 'package:bento_challenge/core/design/ui_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppSplashView extends StatefulWidget {
  const AppSplashView({super.key});

  @override
  State<AppSplashView> createState() => _AppSplashViewState();
}

class _AppSplashViewState extends State<AppSplashView> {
  bool _positionWasTriggered = false;
  bool _logoWasTriggered = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 500));
      _positionWasTriggered = true;
      setState(() {});
      await Future.delayed(const Duration(milliseconds: 80));
    });
  }

  @override
  Widget build(BuildContext context) {
    UIScale.init(context);

    return Material(
      child: Container(
        color: Colors.white,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Positioned(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.elasticOut,
                height: _positionWasTriggered == false ? 0 : MediaQuery.of(context).size.width * 0.8,
                width: _positionWasTriggered == false ? 0 : MediaQuery.of(context).size.width * 0.8,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                onEnd: () {
                  _logoWasTriggered = true;
                  setState(() {});
                },
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              opacity: _logoWasTriggered == false ? 0 : 1,
              child: SizedBox(
                height: MediaQuery.of(context).size.width * 0.55,
                width: MediaQuery.of(context).size.width * 0.55,
                child: Image.asset(
                  './lib/assets/images/cabbage0.png',
                  fit: BoxFit.contain,
                ),
              ),
              onEnd: () async {
                UIScale.forceInit(context);
                handleInitialView();
              },
            ),
          ],
        ),
      ),
    );
  }

  handleInitialView() async {
    Modular.to.pushNamedAndRemoveUntil('/root', (_) => false);
  }
}
