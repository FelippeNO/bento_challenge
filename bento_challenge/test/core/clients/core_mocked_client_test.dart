import 'package:bento_challenge/core/clients/mocked_paths.dart';
import 'package:bento_challenge/product/data/product_details_data.dart';
import 'package:bento_challenge/root/home/data/food_kind_data.dart';
import 'package:bento_challenge/root/home/data/home_highlight_data.dart';
import 'package:bento_challenge/root/home/data/home_offer_data.dart';
import 'package:bento_challenge/root/home/data/home_products_session_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MockedPaths Tests', () {
    test('should return food kind data for /home/food_kinds', () {
      final response = MockedPaths.getDataFromPath('/home/food_kinds');
      expect(response.statusCode, 200);
      expect(response.data, foodKindData);
    });

    test('should return highlights data for /home/highlights', () {
      final response = MockedPaths.getDataFromPath('/home/highlights');
      expect(response.statusCode, 200);
      expect(response.data, homeHighlightsData);
    });

    test('should return offers data for /home/offers', () {
      final response = MockedPaths.getDataFromPath('/home/offers');
      expect(response.statusCode, 200);
      expect(response.data, homeOfferData);
    });

    test('should return product sessions data for /home/product_sessions', () {
      final response = MockedPaths.getDataFromPath('/home/product_sessions');
      expect(response.statusCode, 200);
      expect(response.data, homeProductsSessionData);
    });

    test('should return product details for /product/details', () {
      const productId = 1;
      final response = MockedPaths.getDataFromPath('/product/details', queryParameters: {'id': productId});
      final expectedProduct = productDetailsData['products'].firstWhere((product) => product['id'] == productId);

      expect(response.statusCode, 200);
      expect(response.data, expectedProduct);
    });

    test('should return 404 for unknown path', () {
      final response = MockedPaths.getDataFromPath('/unknown/path');
      expect(response.statusCode, 404);
      expect(response.data, {'error': 'Not found'});
    });
  });
}
