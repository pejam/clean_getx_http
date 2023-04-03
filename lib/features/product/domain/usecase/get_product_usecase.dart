import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sample_flutter/core/failure.dart';
import 'package:sample_flutter/core/use_case.dart';
import 'package:sample_flutter/features/product/domain/repository/product_repository.dart';

import '../../../../models/product.dart';

class GetProductUseCase extends UseCase<Product, GetProductParam> {
  ProductRepository productRepository;

  GetProductUseCase({required this.productRepository});

  @override
  Future<Either<Failure, Product>> call(GetProductParam param) async {
    return await productRepository.getProduct(param);
  }
}

class GetProductParam extends Equatable {
  int productId;

  GetProductParam({required this.productId});

  @override
  List<Object?> get props => [productId];
}
