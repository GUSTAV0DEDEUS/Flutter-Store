import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static String productBaseUrl = dotenv.env['PRODUCT_BASEURL'] ?? '';
  static String orderBaseUrl = dotenv.env['ORDER_BASEURL'] ?? '';
  static String userFavoritesBaseUrl =
      dotenv.env['USER_FAVORITE_BASEURL'] ?? '';
  static String key = dotenv.env['KEY'] ?? '';
}
