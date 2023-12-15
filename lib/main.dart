import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:store/firebase_options.dart';
import 'package:store/model/auth.dart';
import 'package:store/model/cart.dart';
import 'package:store/model/order_list.dart';
import 'package:store/model/product_list.dart';
import 'package:store/pages/auth_or_home_page.dart';
import 'package:store/pages/cart_page.dart';
import 'package:store/pages/orders_page.dart';
import 'package:store/pages/product_detail_page.dart';
import 'package:store/pages/product_form.dart';
import 'package:store/pages/products_page.dart';
import 'package:store/utils/app_routes.dart';
import 'package:store/utils/custom_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, ProductList>(
          create: (_) => ProductList(),
          update: (ctx, auth, previous) {
            return ProductList(
              auth.token ?? '',
              auth.userId ?? '',
              previous?.items ?? [],
            );
          },
        ),
        ChangeNotifierProxyProvider<Auth, OrderList>(
          create: (_) => OrderList(),
          update: (ctx, auth, previuos) {
            return OrderList(
              auth.token ?? '',
              auth.userId ?? '',
              previuos?.items ?? [],
            );
          },
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        )
      ],
      child: MaterialApp(
        title: 'Store demo',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          useMaterial3: true,
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.iOS: CustomPageTransitionsBuilder(),
            TargetPlatform.android: CustomPageTransitionsBuilder(),
            TargetPlatform.windows: CustomPageTransitionsBuilder(),
          }),
          fontFamily: 'Lato',
        ),
        routes: {
          AppRoutes.AUTHORHOME: (ctx) => const AuthOrHomePage(),
          AppRoutes.PRODUCT_DETAIL: (ctx) => const ProductDetailPage(),
          AppRoutes.CART: (ctx) => const CartPage(),
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
