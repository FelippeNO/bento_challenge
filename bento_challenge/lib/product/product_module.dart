import 'package:bento_challenge/core/clients/core_mocked_client.dart';
import 'package:bento_challenge/product/data/gateways/product_gateway.dart';
import 'package:bento_challenge/product/data/repositories/product_repository.dart';
import 'package:bento_challenge/product/domain/services/get_product_details_by_id_service.dart';
import 'package:bento_challenge/product/presentation/views/controllers/product_details_controller.dart';
import 'package:bento_challenge/product/presentation/views/product_details_view.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<IMockedClient>(CoreMockedClient.new);
    i.addSingleton<IProductGateway>(ProductGateway.new);
    i.addSingleton<IProductRepository>(ProductRepository.new);

    i.addSingleton<GetProductDetailsByIdService>(GetProductDetailsByIdService.new);

    i.addSingleton<ProductDetailsController>(ProductDetailsController.new);
  }

  @override
  void routes(r) {
    r.child(
      '/details',
      child: (context) => const ProductDetailsView(),
    );
  }
}
