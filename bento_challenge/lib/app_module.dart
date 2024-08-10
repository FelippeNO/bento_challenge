import 'package:bento_challenge/main.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  List<Module> imports = [];

  @override
  void routes(r) {
    r.child('/',
        child: (context) => const MyHomePage(
              title: 'Bento Challenge',
            ));
  }
}
