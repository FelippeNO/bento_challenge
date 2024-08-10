import 'package:dartz/dartz.dart';

import '../error/core_exception.dart';
import '../error/core_failure.dart';

/// A class responsible for handling the communication between repositories and the gateway layer.
///
/// Executes the [gatewayCallback] and returns its result as a [Right] value if successful or a [Left] value
/// containing the [failure] object if it throws an exception.
///
/// Example usage:
///
/// ```dart
/// final result = await RepositoryHandler().call(
///   gatewayCallback: () => myGateway.fetchData(),
///   failure: MyFailure(),
/// );
///
/// result.fold(
///   (failure) => print('Error: ${failure.message}'),
///   (data) => print('Data: $data'),
/// );
/// ```

abstract class RepositoryHandler {
  Future<Either<CoreFailure, T>> call<T>({
    required Future<T> Function() gatewayCallback,
    required CoreFailure failure,
  }) async {
    try {
      final result = await gatewayCallback();
      return Right(result);
    } on CoreException catch (exception) {
      failure.addFailureMessages(exception.failureMessages);
      return Left(failure);
    } on Exception {
      return Left(failure);
    }
  }
}
