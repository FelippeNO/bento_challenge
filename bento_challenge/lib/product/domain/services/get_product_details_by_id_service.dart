import 'package:bento_challenge/core/error/core_failure.dart';
import 'package:bento_challenge/product/data/repositories/product_repository.dart';
import 'package:bento_challenge/product/domain/entities/product_details_entity.dart';
import 'package:dartz/dartz.dart';

class GetProductDetailsByIdService {
  final IProductRepository _productRepository;

  GetProductDetailsByIdService(this._productRepository);

  Future<Either<CoreFailure, ProductDetailsEntity>> call(int id) {
    return _productRepository.getProductDetailsById(id);
  }
}
