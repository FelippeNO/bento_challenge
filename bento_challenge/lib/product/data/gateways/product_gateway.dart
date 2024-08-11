import 'package:bento_challenge/core/clients/core_mocked_client.dart';
import 'package:bento_challenge/core/utils/gateway_handler.dart';
import 'package:bento_challenge/product/domain/entities/product_details_entity.dart';
import 'package:bento_challenge/product/error/exception.dart';

abstract class IProductGateway {
  Future<ProductDetailsEntity> getProductDetailsById(int id);
}

class ProductGateway extends GatewayHandler implements IProductGateway {
  final IMockedClient _client;

  ProductGateway(this._client);

  @override
  Future<ProductDetailsEntity> getProductDetailsById(int id) async {
    return call(
      requisitionCallback: () => _client.get('/product/details', queryParameters: {'id': id}),
      onSuccessCallback: (data) => ProductDetailsEntity.fromMap(data),
      exception: GetProductDetailsByIdException(),
    );
  }
}
