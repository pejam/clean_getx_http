import 'package:http/http.dart' as http;
import 'package:sample_flutter/features/product/domain/usecase/get_product_usecase.dart';
import 'package:sample_flutter/models/product.dart';

import '../../../../core/remote/api_config.dart';
import '../../../../core/remote/api_provider.dart';

abstract class ProductRemoteDataSource {
  Future<List<Product>> getProducts();

  Future<Product> getProduct(GetProductParam param);

  Future<bool> addProduct();
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  ApiProvider apiProvider;
  ApiConfig apiConfig;

  ProductRemoteDataSourceImpl(
      {required this.apiProvider, required this.apiConfig});

  @override
  Future<Product> getProduct(GetProductParam param) async {
    return await apiProvider.getRequest(
        route: "${ApiConfig.product}/${param.productId}",
        getJsonCallback: Product.fromJson);
  }

  @override
  Future<List<Product>> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }

  @override
  Future<bool> addProduct() {
    // TODO: implement getProduct
    throw UnimplementedError();
  }
}
