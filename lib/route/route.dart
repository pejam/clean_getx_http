import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../features/cart/cart_screen.dart';
import '../features/initial/initial_screen.dart';
import '../features/product/presentation/screen/product_screen.dart';

class RouteManager {
  static const String initial = '/';
  static const String product = '/product';
  static const String cart = '/cart';

  static String getInitialRoute() => initial;

  static String getProductRoute() => product;

  static String getCartRoute() => cart;

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const InitialScreen(), children: [
      GetPage(
        name: product,
        page: () => ProductScreen(),
      ),
      GetPage(
        name: cart,
        page: () => const CartScreen(),
      ),
    ]),
  ];

  static getRoute(Widget navigateTo) {
    return navigateTo;
  }
}
