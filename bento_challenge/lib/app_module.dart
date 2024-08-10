import 'package:bento_challenge/product/product_module.dart';
import 'package:bento_challenge/root/presentation/views/root_view.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  List<Module> imports = [
    ProductModule(),
  ];

  @override
  void routes(r) {
    r.child('/', child: (context) => const RootView());
    r.module('/product', module: ProductModule());
  }
}
