import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:sample_flutter/core/controller/base_controller.dart';

import '../../../../core/failure.dart';
import '../../../../core/server_failure.dart';
import '../../../../models/product.dart';
import '../../domain/usecase/add_product_usecase.dart';
import '../../domain/usecase/get_product_usecase.dart';
import '../../domain/usecase/get_products_usecase.dart';

class ProductController extends GetxController with BaseController {
  GetProductsUseCase getProductsUseCase;
  GetProductUseCase getProductUseCase;
  AddProductUseCase addProductUseCase;

  ProductController(
      {required this.getProductsUseCase,
      required this.getProductUseCase,
      required this.addProductUseCase});

  void getProduct(int id) async {
    apiStatus.value = ApiState.loading;
    _checkFailureOrSuccess(
        await getProductUseCase.call(GetProductParam(productId: id)));
  }

  _checkFailureOrSuccess(Either<Failure, Product> failureOrSuccess) {
    failureOrSuccess.fold(
      (Failure failure) {
        apiStatus.value = ApiState.failure;
        //errorMessage = failure.obs;
      },
      (Product success) {
        apiStatus.value = ApiState.success;
      },
    );
  }
}
