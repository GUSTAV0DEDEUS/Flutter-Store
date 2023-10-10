import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/model/product_list.dart';
import 'package:store/pages/counter_page.dart';
import 'package:store/pages/product_detail_page.dart';
import 'package:store/pages/products_overview_page.dart';
import 'package:store/providers/counter.dart';
import 'package:store/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductList(),
      child: MaterialApp(
        title: 'Store demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'Lato',
        ),
        routes: {
          AppRoutes.PRODUCT_DETAIL: (ctx) => const CounterPage(),
        },
        debugShowCheckedModeBanner: false,
        home: const ProductsOverviewPage(),
      ),
    );
  }
}
