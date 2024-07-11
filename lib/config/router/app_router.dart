import 'package:flutter/material.dart';

import 'routes_name.dart';

class AppRouter {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      // case RoutesName.productsScreen:
      //   return MaterialPageRoute(
      //     builder: (context) => const ProductsScreen(),
      //   );

      default:
        return MaterialPageRoute(builder: (context) => unDefinePageRoute());
    }
  }

  static Widget unDefinePageRoute() {
    return const Scaffold(
      body: Center(
        child: Text("Un Defined PageRoute"),
      ),
    );
  }
}
