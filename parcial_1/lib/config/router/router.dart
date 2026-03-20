import 'package:go_router/go_router.dart';
import 'package:parcial_1/config/router/router_config.dart';
import 'package:parcial_1/presentation/screen/home/home_screen.dart';
import 'package:parcial_1/presentation/screen/product/product_detail_screen.dart';
import 'package:parcial_1/presentation/screen/shared/layout.dart';


final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    ShellRoute(
      builder: (context, state, child) {
        String? data = state.topRoute?.name ?? 'Administrador';
        return Layout(title: data, child: child);
      },

      routes: [
        ...routerConfig.map((route) {
          return GoRoute(
            path: route.path,
            name: route.name,
            builder: (context, state) => route.widget(context, state),
          );
        }),
      ],
    ),
    GoRoute(
      path: '/product/:id',
      name: 'product_detail',
      builder: (context, state) {
        int id = int.parse(state.pathParameters['id']!);
        return ProductDetailScreen(id: id);
      },
    ),
  ],

  errorBuilder: (context, state) => HomeScreen(),
);
