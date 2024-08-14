import 'dart:ui';

import 'package:bento_challenge/root/home/data/gateways/home_gateway.dart';
import 'package:bento_challenge/root/home/data/repositories/home_repository.dart';
import 'package:bento_challenge/root/home/domain/entities/food_kind_entity.dart';
import 'package:bento_challenge/root/home/domain/entities/home_highlight_entity.dart';
import 'package:bento_challenge/root/home/domain/entities/home_offer_entity.dart';
import 'package:bento_challenge/root/home/domain/entities/home_products_session_entity.dart';
import 'package:bento_challenge/root/home/error/exceptions.dart';
import 'package:bento_challenge/root/home/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeGateway extends Mock implements IHomeGateway {}

void main() {
  late MockHomeGateway mockHomeGateway;
  late HomeRepository homeRepository;

  setUp(() {
    mockHomeGateway = MockHomeGateway();
    homeRepository = HomeRepository(mockHomeGateway);
  });

  group('HomeRepository Tests', () {
    test('getFoodKinds should return Right(List<FoodKindEntity>) on success', () async {
      final foodKindEntities = <FoodKindEntity>[
        const FoodKindEntity(id: 1, name: 'Vegan', iconPath: './lib/assets/png_icons/vegetable.png'),
      ];

      when(() => mockHomeGateway.getFoodKinds()).thenAnswer((_) async => foodKindEntities);

      final result = await homeRepository.getFoodKinds();

      expect(result, Right(foodKindEntities));
      verify(() => mockHomeGateway.getFoodKinds()).called(1);
    });

    test('getFoodKinds should return Left(CoreFailure) on failure', () async {
      when(() => mockHomeGateway.getFoodKinds()).thenThrow(GetFoodKindsException());

      final result = await homeRepository.getFoodKinds();

      expect(result, Left(GetFoodKindsFailure()));
      verify(() => mockHomeGateway.getFoodKinds()).called(1);
    });

    test('getHomeHighlights should return Right(List<HomeHighlightEntity>) on success', () async {
      final homeHighlightEntities = <HomeHighlightEntity>[
        HomeHighlightEntity(title: 'Highlight', iconPath: 'path/to/image'),
      ];

      when(() => mockHomeGateway.getHomeHighlights()).thenAnswer((_) async => homeHighlightEntities);

      final result = await homeRepository.getHomeHighlights();

      expect(result, Right(homeHighlightEntities));
      verify(() => mockHomeGateway.getHomeHighlights()).called(1);
    });

    test('getHomeHighlights should return Left(CoreFailure) on failure', () async {
      when(() => mockHomeGateway.getHomeHighlights()).thenThrow(GetHomeHighlightsException());

      final result = await homeRepository.getHomeHighlights();

      expect(result, Left(GetHomeHighlightsFailure()));
      verify(() => mockHomeGateway.getHomeHighlights()).called(1);
    });

    test('getHomeOffers should return Right(List<HomeOfferEntity>) on success', () async {
      final homeOfferEntities = <HomeOfferEntity>[
        HomeOfferEntity(
          title: 'Offer',
          imagePath: 'path/to/image',
          imageLayout: ImageLayoutEnum.center,
          backgroundColor: const Color(0xFF000000),
        ),
      ];

      when(() => mockHomeGateway.getHomeOffers()).thenAnswer((_) async => homeOfferEntities);

      final result = await homeRepository.getHomeOffers();

      expect(result, Right(homeOfferEntities));
      verify(() => mockHomeGateway.getHomeOffers()).called(1);
    });

    test('getHomeOffers should return Left(CoreFailure) on failure', () async {
      when(() => mockHomeGateway.getHomeOffers()).thenThrow(GetHomeOffersException());

      final result = await homeRepository.getHomeOffers();

      expect(result, Left(GetHomeOffersFailure()));
      verify(() => mockHomeGateway.getHomeOffers()).called(1);
    });

    test('getHomeProductSessions should return Right(List<HomeProductsSessionEntity>) on success', () async {
      final homeProductSessionEntities = <HomeProductsSessionEntity>[
        HomeProductsSessionEntity(name: 'Session', productSnapshots: []),
      ];

      when(() => mockHomeGateway.getHomeProductSessions()).thenAnswer((_) async => homeProductSessionEntities);

      final result = await homeRepository.getHomeProductSessions();

      expect(result, Right(homeProductSessionEntities));
      verify(() => mockHomeGateway.getHomeProductSessions()).called(1);
    });

    test('getHomeProductSessions should return Left(CoreFailure) on failure', () async {
      when(() => mockHomeGateway.getHomeProductSessions()).thenThrow(GetHomeProductSessionsException());

      final result = await homeRepository.getHomeProductSessions();

      expect(result, Left(GetHomeProductSessionsFailure()));
      verify(() => mockHomeGateway.getHomeProductSessions()).called(1);
    });
  });
}
