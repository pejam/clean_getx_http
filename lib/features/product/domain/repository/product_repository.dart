import 'package:dartz/dartz.dart';
import 'package:sample_flutter/features/product/domain/usecase/get_products_usecase.dart';
import 'package:sample_flutter/models/product.dart';

import '../../../../core/failure.dart';
import '../usecase/add_product_usecase.dart';
import '../usecase/get_product_usecase.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts(GetProductsParam param);

  Future<Either<Failure, Product>> getProduct(GetProductParam param);

  Future<Either<Failure, bool>> addProduct(AddProductParam param);
}
