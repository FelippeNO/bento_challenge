import 'package:bento_challenge/core/utils/mocked_response.dart';
import 'package:bento_challenge/product/data/product_details_data.dart';
import 'package:bento_challenge/root/home/data/food_kind_data.dart';
import 'package:bento_challenge/root/home/data/home_highlight_data.dart';
import 'package:bento_challenge/root/home/data/home_offer_data.dart';
import 'package:bento_challenge/root/home/data/home_products_session_data.dart';

class MockedPaths {
  static MockedResponse getDataFromPath(String path, {Map<String, dynamic>? queryParameters}) {
    return switch (path) {
      '/product/details' => MockedResponse(
          statusCode: 200,
          data: _getProductById(queryParameters),
        ),
      '/home/food_kinds' => MockedResponse(
          statusCode: 200,
          data: foodKindData,
        ),
      '/home/highlights' => MockedResponse(
          statusCode: 200,
          data: homeHighlightsData,
        ),
      '/home/offers' => MockedResponse(
          statusCode: 200,
          data: homeOfferData,
        ),
      '/home/product_sessions' => MockedResponse(
          statusCode: 200,
          data: homeProductsSessionData,
        ),
      _ => MockedResponse(
          statusCode: 404,
          data: {'error': 'Not found'},
        )
    };
  }

  static _getProductById(Map<String, dynamic>? queryParameters) {
    final id = queryParameters!['id'];
    final products = productDetailsData['products'];
    final product = products.firstWhere((product) => product['id'] == id);
    return product;
  }
}
