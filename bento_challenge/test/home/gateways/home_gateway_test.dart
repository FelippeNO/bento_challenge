import 'package:bento_challenge/core/clients/core_mocked_client.dart';
import 'package:bento_challenge/core/utils/mocked_response.dart';
import 'package:bento_challenge/root/home/data/food_kind_data.dart';
import 'package:bento_challenge/root/home/data/gateways/home_gateway.dart';
import 'package:bento_challenge/root/home/data/home_highlight_data.dart';
import 'package:bento_challenge/root/home/data/home_offer_data.dart';
import 'package:bento_challenge/root/home/data/home_products_session_data.dart';
import 'package:bento_challenge/root/home/domain/entities/food_kind_entity.dart';
import 'package:bento_challenge/root/home/domain/entities/home_highlight_entity.dart';
import 'package:bento_challenge/root/home/domain/entities/home_offer_entity.dart';
import 'package:bento_challenge/root/home/domain/entities/home_products_session_entity.dart';
import 'package:bento_challenge/root/home/error/exceptions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockIMockedClient extends Mock implements IMockedClient {}

void main() {
  late MockIMockedClient mockedClient;
  late HomeGateway homeGateway;

  setUp(() {
    mockedClient = MockIMockedClient();
    homeGateway = HomeGateway(mockedClient);
  });

  group('HomeGateway Tests', () {
    test('getFoodKinds should return list of FoodKindEntity', () async {
      when(() => mockedClient.get('/home/food_kinds')).thenAnswer(
        (_) async => MockedResponse(statusCode: 200, data: foodKindData),
      );

      final result = await homeGateway.getFoodKinds();
      expect(result, isA<List<FoodKindEntity>>());
      expect(result.length, foodKindData['kinds'].length);
    });

    test('getHomeHighlights should return list of HomeHighlightEntity', () async {
      when(() => mockedClient.get('/home/highlights')).thenAnswer(
        (_) async => MockedResponse(statusCode: 200, data: homeHighlightsData),
      );

      final result = await homeGateway.getHomeHighlights();
      expect(result, isA<List<HomeHighlightEntity>>());
      expect(result.length, homeHighlightsData['highlights'].length);
    });

    test('getHomeOffers should return list of HomeOfferEntity', () async {
      when(() => mockedClient.get('/home/offers')).thenAnswer(
        (_) async => MockedResponse(statusCode: 200, data: homeOfferData),
      );

      final result = await homeGateway.getHomeOffers();
      expect(result, isA<List<HomeOfferEntity>>());
      expect(result.length, homeOfferData['offers'].length);
    });

    test('getHomeProductSessions should return list of HomeProductsSessionEntity', () async {
      when(() => mockedClient.get('/home/product_sessions')).thenAnswer(
        (_) async => MockedResponse(statusCode: 200, data: homeProductsSessionData),
      );

      final result = await homeGateway.getHomeProductSessions();
      expect(result, isA<List<HomeProductsSessionEntity>>());
      expect(result.length, homeProductsSessionData['sessions'].length);
    });

    test('should throw GetFoodKindsException when getFoodKinds fails', () async {
      when(() => mockedClient.get('/home/food_kinds')).thenThrow(Exception());

      expect(() => homeGateway.getFoodKinds(), throwsA(isA<GetFoodKindsException>()));
    });

    test('should throw GetHomeHighlightsException when getHomeHighlights fails', () async {
      when(() => mockedClient.get('/home/highlights')).thenThrow(Exception());

      expect(() => homeGateway.getHomeHighlights(), throwsA(isA<GetHomeHighlightsException>()));
    });

    test('should throw GetHomeOffersException when getHomeOffers fails', () async {
      when(() => mockedClient.get('/home/offers')).thenThrow(Exception());

      expect(() => homeGateway.getHomeOffers(), throwsA(isA<GetHomeOffersException>()));
    });

    test('should throw GetHomeProductSessionsException when getHomeProductSessions fails', () async {
      when(() => mockedClient.get('/home/product_sessions')).thenThrow(Exception());

      expect(() => homeGateway.getHomeProductSessions(), throwsA(isA<GetHomeProductSessionsException>()));
    });
  });
}
