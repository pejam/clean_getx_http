import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sample_flutter/core/failure.dart';
import 'package:sample_flutter/core/use_case.dart';

import '../repository/product_repository.dart';

class AddProductUseCase extends UseCase<bool, AddProductParam> {
  ProductRepository productRepository;

  AddProductUseCase({required this.productRepository});

  @override
  Future<Either<Failure, bool>> call(AddProductParam param) {
    // TODO: implement call
    throw UnimplementedError();
  }

}

class AddProductParam extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
