import 'package:flutter/material.dart';
import 'package:parcial_1/model/product_model.dart';
import 'package:parcial_1/presentation/widget/product_detail_view.dart';
import 'package:parcial_1/service/product_service.dart';

class ProductDetailScreen extends StatelessWidget {
  final int id;

  const ProductDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProductModel?>(
      future: ProductService().getProductById(id),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError || snapshot.data == null) {
          return const Scaffold(body: Center(child: Text("No disponible")));
        }

        final p = snapshot.data!;
        final images = p.images.isNotEmpty ? p.images : [p.thumbnail];

        return ProductDetailView(p: p, images: images);
      },
    );
  }
}
