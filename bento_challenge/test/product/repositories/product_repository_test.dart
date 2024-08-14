import 'package:bento_challenge/product/data/gateways/product_gateway.dart';
import 'package:bento_challenge/product/data/repositories/product_repository.dart';
import 'package:bento_challenge/product/domain/entities/product_details_entity.dart';
import 'package:bento_challenge/product/error/exception.dart';
import 'package:bento_challenge/product/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockProductGateway extends Mock implements IProductGateway {}

void main() {
  late MockProductGateway mockProductGateway;
  late ProductRepository productRepository;

  setUp(() {
    mockProductGateway = MockProductGateway();
    productRepository = ProductRepository(mockProductGateway);
  });

  group('ProductRepository Tests', () {
    test('getProductDetailsById should return Right(ProductDetailsEntity) on success', () async {
      const productId = 1;
      final productDetailsEntity = ProductDetailsEntity(
        id: 1,
        shortName: 'Orange',
        name: 'Lol',
        shop: 'Market',
        price: '9.99',
        rating: '3.3',
        imagesPath: ['das'],
        details: 'Details',
        isFavorited: true,
        categories: [],
        backgroundColor: Colors.red,
      );

      when(() => mockProductGateway.getProductDetailsById(productId)).thenAnswer((_) async => productDetailsEntity);

      final result = await productRepository.getProductDetailsById(productId);

      expect(result, Right(productDetailsEntity));
      verify(() => mockProductGateway.getProductDetailsById(productId)).called(1);
    });

    test('getProductDetailsById should return Left(CoreFailure) on failure', () async {
      const productId = 1;

      when(() => mockProductGateway.getProductDetailsById(productId)).thenThrow(GetProductDetailsByIdException());

      final result = await productRepository.getProductDetailsById(productId);

      expect(result, Left(GetProductDetailsByIdFailure()));
      verify(() => mockProductGateway.getProductDetailsById(productId)).called(1);
    });
  });
}
