import 'package:bento_challenge/product/presentation/views/product_details_view.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(
      '/details',
      child: (context) => const ProductDetailsView(),
    );
  }
}
