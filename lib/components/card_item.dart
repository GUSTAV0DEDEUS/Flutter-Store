import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/model/card_item.dart';
import 'package:store/model/cart.dart';

class CartItemWidget extends StatelessWidget {
  final CardItem cardItem;
  const CartItemWidget({
    super.key,
    required this.cardItem,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cardItem.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).colorScheme.error,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 25,
        ),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      child: Card(
        elevation: 1,
        shape: BeveledRectangleBorder(),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 25,
        ),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: FittedBox(
                child: Text('${cardItem.price}'),
              ),
            ),
          ),
          title: Text(cardItem.name),
          subtitle: Text('Total: R\$ ${cardItem.price * cardItem.quantity}'),
          trailing: Text('${cardItem.quantity}x'),
        ),
      ),
      confirmDismiss: (_) {
        return showDialog<bool>(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: const Text('Tem certeza?'),
                  content: const Text('Quer remover o item do carrinho'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop(false);
                      },
                      child: const Text('Nao'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop(true);
                      },
                      child: const Text('Sim'),
                    )
                  ],
                ));
      },
      onDismissed: (_) {
        Provider.of<Cart>(context, listen: false)
            .removeItem(cardItem.productId);
      },
    );
  }
}
