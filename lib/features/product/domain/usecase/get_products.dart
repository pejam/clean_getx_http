import 'package:dartz/dartz.dart';
import 'package:sample_flutter/core/failure.dart';
import 'package:sample_flutter/core/use_case.dart';
import 'package:sample_flutter/models/product.dart';

class GetProducts extends UseCase<List<Product>, GetProductsParam> {
  @override
  Future<Either<Failure, List<Product>>> call(GetProductsParam param) {
    // TODO: implement call
    throw UnimplementedError();
  }

}

class GetProductsParam {
  final int limit;

  GetProductsParam({required this.limit});
}
