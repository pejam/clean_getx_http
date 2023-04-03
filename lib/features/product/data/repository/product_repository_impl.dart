import 'package:dartz/dartz.dart';
import 'package:sample_flutter/core/failure.dart';
import 'package:sample_flutter/features/product/data/data_source/product_remote_data_source.dart';
import 'package:sample_flutter/features/product/domain/repository/product_repository.dart';
import 'package:sample_flutter/features/product/domain/usecase/add_product_usecase.dart';
import 'package:sample_flutter/features/product/domain/usecase/get_product_usecase.dart';
import 'package:sample_flutter/features/product/domain/usecase/get_products_usecase.dart';
import 'package:sample_flutter/models/product.dart';

import '../../../../core/repository/repository_helper.dart';

class ProductRepositoryImpl extends ProductRepository  with RepositoryHelper<Product> {
  ProductRemoteDataSource productRemoteDataSource;

  ProductRepositoryImpl({required this.productRemoteDataSource});

  @override
  Future<Either<Failure, Product>> getProduct(GetProductParam param) async {
    return checkItemFailOrSuccess(
        productRemoteDataSource.getProduct(param)
    );
  }

  @override
  Future<Either<Failure, List<Product>>> getProducts(GetProductsParam param) {
    // TODO: implement getProducts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> addProduct(AddProductParam param) {
    // TODO: implement addProduct
    throw UnimplementedError();
  }
}
