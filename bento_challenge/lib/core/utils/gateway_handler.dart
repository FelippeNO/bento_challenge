import 'package:bento_challenge/core/utils/mocked_response.dart';
import 'package:flutter/foundation.dart';

import '../error/core_exception.dart';

/// The `GatewayHandler` class is an abstract class that provides a template for making HTTP requests
/// to an API endpoint and handling the response. This class contains a single method called `call` that
/// takes several parameters and returns a `Future` of type T.
///
/// To use this class, you must create a new class that extends the `GatewayHandler` class and
/// implement the `requisitionCallback`, `onSuccessCallback`, and `exception` parameters.

abstract class GatewayHandler {
  /// The `call` method takes the following parameters:
  ///
  /// * `requisitionCallback`: a required asynchronous function that returns a `Future<Response>`.
  /// This function is responsible for making the HTTP request to the API endpoint.
  ///
  /// * `onSuccessCallback`: a required function that takes a dynamic `data` parameter and returns an object of type T.
  /// This function is called if the API endpoint returns a response with a status code that matches one of the `successCodes`
  /// passed to the `call` method. The `data` parameter is the data returned from the API endpoint.
  ///
  /// * `exception`: a required object of type `NewCoreException`. This exception will be thrown if the API endpoint returns
  /// a response with a status code that does not match one of the `successCodes` passed to the `call` method or if an error
  /// occurs during the HTTP request.
  ///
  /// * `successCodes`: an optional list of integers that represent the HTTP status codes that are considered successful
  /// responses from the API endpoint. By default, the `successCodes` list includes the codes 200 and 201.
  ///
  /// * `printResult`: an optional boolean value that determines whether the response data should be printed to the console.
  /// By default, this value is set to `false`.
  ///
  /// The `call` method returns a `Future` of type T. If the API endpoint returns a response with a status code that matches
  /// one of the `successCodes` passed to the `call` method, the `onSuccessCallback` function is called with the response data,
  /// and the result of the function is returned. If the API endpoint returns a response with a status code that does not match
  /// one of the `successCodes` passed to the `call` method, or if an error occurs during the HTTP request, the `exception`
  /// parameter is thrown.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// class MyGateway extends GatewayHandler {
  ///   Future<MyModel> getMyModel() async {
  ///     return call<MyModel>(
  ///       requisitionCallback: () => httpClient.get(apiUrl);
  ///       onSuccessCallback: (data) => MyModel.fromJson(data);
  ///       exception: NewCoreException('Failed to get MyModel.'),
  ///       printResult: true,
  ///     );
  ///   }
  /// }
  /// ```

  Future<T> call<T>({
    required Future<MockedResponse> Function() requisitionCallback,
    required T Function(dynamic data) onSuccessCallback,
    required CoreException exception,
    List<int> successCodes = const [200, 201],
    bool printResult = false,
  }) async {
    try {
      final MockedResponse result = await requisitionCallback();

      if (printResult == true) {
        debugPrint('\x1B[33m${result.data}\x1B[0m');
      }

      for (var i = 0; i < successCodes.length; i++) {
        if (result.statusCode == successCodes[i]) {
          if (printResult) debugPrint('\x1B[33m${result.data}\x1B[0m');
          return onSuccessCallback(result.data);
        }
      }

      if (result.data['message'] != null) {
        exception.addFailureMessage(result.data['message'].toString());
      }

      throw exception;
    } catch (e) {
      debugPrint(e.toString());
      exception.printE();
      throw exception;
    }
  }
}
