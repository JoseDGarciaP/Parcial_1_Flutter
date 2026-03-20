import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parcial_1/config/router/router_config.dart';


class DrawerCustom extends StatelessWidget {
  const DrawerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ...routerConfig.map((route) {
            return ListTile(
              leading: Icon(route.icon),
              iconColor: Colors.blue,
              title: Text(route.name),
              subtitle: Text(route.description),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
              onTap: () {
                Navigator.pop(context);
                context.go(route.path);
              },
            );
          }),
        ],
      ),
    );
  }
}
