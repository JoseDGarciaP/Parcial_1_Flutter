import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Bienvenido a la aplicación de productos'),
          Text('José David García Pineda - 192349'),
          Text('Michell Juliana Pérez Gómez - 192354')
        ],
      ),
    );
  }
}
