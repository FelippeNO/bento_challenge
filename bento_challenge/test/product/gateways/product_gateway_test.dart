import 'package:bento_challenge/core/clients/core_mocked_client.dart';
import 'package:bento_challenge/core/utils/mocked_response.dart';
import 'package:bento_challenge/product/data/gateways/product_gateway.dart';
import 'package:bento_challenge/product/domain/entities/product_details_entity.dart';
import 'package:bento_challenge/product/error/exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockIMockedClient extends Mock implements IMockedClient {}

void main() {
  late MockIMockedClient mockClient;
  late ProductGateway productGateway;

  setUp(() {
    mockClient = MockIMockedClient();
    productGateway = ProductGateway(mockClient);
  });

  group('ProductGateway Tests', () {
    test('getProductDetailsById should return ProductDetailsEntity on success', () async {
      const productId = 4;
      final productDetailsData = {
        'id': 4,
        'name': 'Delicious Fresh Organic Lemon',
        'short_name': 'Organic Lemon',
        'shop': 'Lemon Orchard',
        'price': '3.99',
        'rating': '4.6',
        'images_path': [
          './lib/assets/images/lemon0.png',
          './lib/assets/images/lemon1.png',
        ],
        'comparative_price': '4.50',
        'details':
            'Our organic lemons are handpicked to ensure the highest quality. They are renowned for their intense citrus aroma and tart flavor, making them perfect for culinary uses, from baking to salad dressings. These lemons are grown without synthetic pesticides or fertilizers, making them an environmentally friendly choice for health-conscious consumers.',
        'is_favorited': false,
        'categories': [
          {
            'id': 6,
            'name': 'Paleo',
            'icon_path': './lib/assets/png_icons/paleo.png',
            'background_color': '#f0e0ff',
          },
          {
            'id': 7,
            'name': 'Dairy-Free',
            'icon_path': './lib/assets/png_icons/dairy-free.png',
            'background_color': '#fce8e3',
          },
          {
            'id': 8,
            'name': 'Nut-Free',
            'icon_path': './lib/assets/png_icons/nut-free.png',
            'background_color': '#e8f3fc',
          },
        ],
        'background_color': '#fffbe1',
      };

      when(() => mockClient.get('/product/details', queryParameters: {'id': productId})).thenAnswer(
        (_) async => MockedResponse(statusCode: 200, data: productDetailsData),
      );

      final result = await productGateway.getProductDetailsById(productId);

      expect(result, isA<ProductDetailsEntity>());
      expect(result.id, productId);
      verify(() => mockClient.get('/product/details', queryParameters: {'id': productId})).called(1);
    });

    test('getProductDetailsById should throw GetProductDetailsByIdException on failure', () async {
      const productId = 1;

      when(() => mockClient.get('/product/details', queryParameters: {'id': productId})).thenThrow(Exception());

      expect(
        () => productGateway.getProductDetailsById(productId),
        throwsA(isA<GetProductDetailsByIdException>()),
      );
      verify(() => mockClient.get('/product/details', queryParameters: {'id': productId})).called(1);
    });
  });
}
