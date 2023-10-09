import 'package:flutter/material.dart';
import 'package:store/model/product.dart';
import 'package:store/pages/product_detail_page.dart';
import 'package:store/utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: GridTileBar(
        backgroundColor: Colors.black87,
        title: Text(product.title),
        leading: IconButton(
          onPressed: null,
          icon: Icon(
            Icons.favorite,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        trailing: IconButton(
          onPressed: null,
          icon: Icon(
            Icons.shopping_cart,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(
          AppRoutes.PRODUCT_DETAIL,
          arguments: product,
        ),
        child: Image.network(
          product.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
