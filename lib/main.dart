import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/model/cart.dart';
import 'package:store/model/order_list.dart';
import 'package:store/model/product_list.dart';
import 'package:store/pages/cart_page.dart';
import 'package:store/pages/orders_page.dart';
import 'package:store/pages/product_detail_page.dart';
import 'package:store/pages/product_form.dart';
import 'package:store/pages/products_page.dart';
import 'package:store/pages/products_overview_page.dart';
import 'package:store/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductList(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderList(),
        ),
      ],
      child: MaterialApp(
        title: 'Store demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'Lato',
        ),
        routes: {
          AppRoutes.PRODUCT_DETAIL: (ctx) => const ProductDetailPage(),
          AppRoutes.CART: (ctx) => const CartPage(),
          AppRoutes.HOME: (ctx) => const ProductsOverviewPage(),
          AppRoutes.ORDERS: (ctx) => const OrdersPage(),
          AppRoutes.PRODUCTS: (ctx) => const ProductsPage(),
          AppRoutes.PRODUCT_FORM: (ctx) => const ProductFormPage(),
        },
        debugShowCheckedModeBanner: false,
        // home: const ProductsOverviewPage(),
      ),
    );
  }
}
