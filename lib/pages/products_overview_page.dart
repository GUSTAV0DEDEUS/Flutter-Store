import 'package:flutter/material.dart';
import 'package:store/components/product_item.dart';
import 'package:store/data/dummy_data.dart';
import 'package:store/model/product.dart';

class ProductsOverview extends StatelessWidget {
  final List<Product> loadedProducts = dummyProducts;
  ProductsOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Minha loja"),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: loadedProducts.length,
        itemBuilder: (ctx, i) => ProductItem(product: loadedProducts[i]),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
