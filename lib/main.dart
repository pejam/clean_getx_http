import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'di.dart';
import 'route/route.dart';

Future<void> main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
      ),
      initialRoute: RouteManager.getInitialRoute(),
      getPages: RouteManager.routes,
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}
