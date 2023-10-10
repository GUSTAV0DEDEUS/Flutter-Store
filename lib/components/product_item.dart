import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/model/product.dart';
import 'package:store/utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return GridTile(
      footer: GridTileBar(
        backgroundColor: Colors.black87,
        title: Text(product.name),
        leading: Consumer<Product>(builder: (ctx, product, _) {
          return IconButton(
            onPressed: () => product.toggleFavorite(),
            icon: Icon(
              product.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Theme.of(context).colorScheme.primary,
            ),
          );
        }),
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
