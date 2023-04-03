import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:sample_flutter/core/remote/api_config.dart';
import 'package:sample_flutter/features/product/data/data_source/product_remote_data_source.dart';
import 'package:sample_flutter/features/product/data/repository/product_repository_impl.dart';
import 'package:sample_flutter/features/product/presentation/controller/product_controller.dart';

import 'core/remote/api_provider.dart';
import 'features/product/domain/repository/product_repository.dart';
import 'features/product/domain/usecase/add_product_usecase.dart';
import 'features/product/domain/usecase/get_product_usecase.dart';
import 'features/product/domain/usecase/get_products_usecase.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerFactory(() => ProductController(
      getProductsUseCase: getIt<GetProductsUseCase>(),
      getProductUseCase: getIt<GetProductUseCase>(),
      addProductUseCase: getIt<AddProductUseCase>()));

  getIt.registerFactory(() => GetProductsUseCase(
        productRepository: getIt<ProductRepository>(),
      ));

  getIt.registerFactory(() => GetProductUseCase(
        productRepository: getIt<ProductRepository>(),
      ));

  getIt.registerFactory(() => AddProductUseCase(
        productRepository: getIt<ProductRepository>(),
      ));

  getIt.registerFactory<ProductRepository>(
      () => ProductRepositoryImpl(productRemoteDataSource: getIt()));

  getIt.registerFactory<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(apiProvider: getIt(), apiConfig: getIt()));

  getIt.registerLazySingleton<ApiProvider>(
          () => ApiProvider(httpClient: getIt(), apiConfig: getIt()));

  getIt.registerLazySingleton<http.Client>(() => http.Client());
  getIt.registerLazySingleton<ApiConfig>(() => ApiConfig());

}
