import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_flutter/route/route.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed(RouteManager.product);
          },
          child: const Text('go to product form'),
        ),
      ),
    );
  }
}
