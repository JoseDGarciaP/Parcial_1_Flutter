import 'package:flutter/material.dart';
import 'package:parcial_1/config/router/router.dart';
import 'package:parcial_1/model/product_model.dart';
import 'package:parcial_1/service/product_service.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ProductService().getProducts(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text("No disponible"));
        } else if (snapshot.hasData) {
          final List<ProductModel> data = snapshot.data!;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (_, index) {
              final product = data[index];
              return ListTile(
                onTap: () => router.push('/product/${product.id}'),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    product.thumbnail,
                    width: 56,
                    height: 56,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const Icon(
                      Icons.broken_image,
                      size: 56,
                      color: Colors.grey,
                    ),
                  ),
                ),
                title: Text(product.title),
                subtitle: Text(
                  product.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            },
          );
        } else {
          return const Text("Data not found");
        }
      },
    );
  }
}
