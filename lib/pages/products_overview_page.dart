import 'package:flutter/material.dart';
import 'package:store/components/product_grid.dart';

class ProductsOverview extends StatelessWidget {
  const ProductsOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Minha loja"),
        centerTitle: true,
      ),
      body: const ProductGrid(),
    );
  }
}
