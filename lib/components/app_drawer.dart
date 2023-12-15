import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/model/auth.dart';
import 'package:store/pages/orders_page.dart';
import 'package:store/utils/app_routes.dart';
import 'package:store/utils/custom_route.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text("Bem vindo usuario"),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text("Loja"),
            onTap: () => Navigator.of(context).pushReplacementNamed(
              AppRoutes.AUTHORHOME,
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text("Pedidos"),
            onTap: () => Navigator.of(context).pushReplacement(
              CustomRoute(
                builder: (ctx) => OrdersPage(),
              ),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text("Gerenciar Produtos"),
            onTap: () => Navigator.of(context).pushReplacementNamed(
              AppRoutes.PRODUCTS,
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Sair"),
            onTap: () {
              Provider.of<Auth>(
                context,
                listen: false,
              ).logout();
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.AUTHORHOME,
              );
            },
          ),
        ],
      ),
    );
  }
}
