import 'package:flutter/material.dart';
import 'package:sample_flutter/features/product/presentation/controller/product_controller.dart';

import '../../../../di.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});

  final ProductController _controller = getIt<ProductController>();

  @override
  Widget build(BuildContext context) {

    _controller.getProduct(1);
    return const Scaffold(
      body: Center(
        child: Text('this is product page'),
      ),
    );
  }
}
