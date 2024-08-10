import 'package:bento_challenge/core/error/core_failure.dart';
import 'package:bento_challenge/core/utils/repository_handler.dart';
import 'package:bento_challenge/product/data/gateways/product_gateway.dart';
import 'package:bento_challenge/product/domain/entities/product_details_entity.dart';
import 'package:bento_challenge/product/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class IProductRepository {
  Future<Either<CoreFailure, ProductDetailsEntity>> getProductDetailsById(int id);
}

class ProductRepository extends RepositoryHandler implements IProductRepository {
  final IProductGateway _gateway;

  ProductRepository(this._gateway);

  @override
  Future<Either<CoreFailure, ProductDetailsEntity>> getProductDetailsById(int id) async {
    return call(
      gatewayCallback: () => _gateway.getProductDetailsById(id),
      failure: GetProductDetailsByIdFailure(),
    );
  }
}
