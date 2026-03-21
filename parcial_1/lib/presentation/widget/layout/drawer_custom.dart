import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parcial_1/config/router/router_config.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 160, 
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const NetworkImage(
                  'https://images.unsplash.com/photo-1557682224-5b8590cd9ec5?w=400&fit=crop',
                ),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  const Color(0xFF2563EB).withValues(alpha: 0.80), 
                  BlendMode.srcOver,
                ),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white24,
                  child: Icon(
                    Icons.person,
                    size: 36,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Parcial 1',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.surface,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Ingeniería de sistemas',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          ...routerConfig.map((route) {
            return ListTile(
              leading: Icon(route.icon),
              iconColor: Theme.of(context).colorScheme.primary,
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