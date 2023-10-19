import 'package:store/model/card_item.dart';

class Order {
  final String id;
  final double total;
  final List<CardItem> products;
  final DateTime date;
  Order({
    required this.id,
    required this.total,
    required this.products,
    required this.date,
  });
}
