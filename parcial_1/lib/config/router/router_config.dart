import 'package:flutter/material.dart';
import 'package:parcial_1/config/router/router_model.dart';
import 'package:parcial_1/presentation/screen/home/home_screen.dart';
import 'package:parcial_1/presentation/screen/product/product_screen.dart';

List<RouterModel> routerConfig = [
  RouterModel(
    name: 'Home',
    title: 'Home',
    description: 'Home',
    path: '/',
    icon:  Icons.home,
    widget: (context, state) => const HomeScreen(),
  ),

  RouterModel(
    name: 'Products',
    title: 'Products',
    description: 'Products',
    path: '/products',
    icon: Icons.shopping_cart,
    widget: (context, state) => const ProductScreen(),
  ),

];
