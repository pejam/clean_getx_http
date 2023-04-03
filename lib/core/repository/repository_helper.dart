import 'package:dartz/dartz.dart';
import 'package:sample_flutter/core/failure.dart';
import 'package:sample_flutter/core/server_failure.dart';

import '../model/wrapper_error.dart';

mixin RepositoryHelper<T> {
  Future<Either<Failure, List<T>>> checkItemsFailOrSuccess(
      Future<List<T>> apiCallback) async {
    try {
      final List<T> items = await apiCallback;
      return Right(items);
    } on WrapperError catch (we) {
      ServerFailure serverFailure =
          ServerFailure(message: we.message, code: we.statusCode.toString());
      return Left(serverFailure);
    }
  }

  Future<Either<Failure, T>> checkItemFailOrSuccess(
      Future<T> apiCallback) async {
    try {
      final T item = await apiCallback;
      return Right(item);
    } on WrapperError catch (we) {
      ServerFailure serverFailure =
      ServerFailure(message: we.message, code: we.statusCode.toString());
      return Left(serverFailure);
    }
  }
}
