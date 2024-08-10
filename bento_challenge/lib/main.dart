import 'package:bento_challenge/app_module.dart';
import 'package:bento_challenge/core/design/ui_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() {
  return runApp(ModularApp(module: AppModule(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setNavigatorKey(navigatorKey);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Bento Challenge',
      theme: UIThemeData.normalTheme,
      routerConfig: Modular.routerConfig,
      scaffoldMessengerKey: rootScaffoldMessengerKey,
    );
  }
}
