import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Bienvenido a la aplicación de productos',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text(
            'José David García Pineda - 192349',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Michell Juliana Pérez Gómez - 192354',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ],
      ),
    );
  }
}