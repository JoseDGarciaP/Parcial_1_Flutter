import 'package:flutter/material.dart';
import 'package:parcial_1/config/router/router.dart';
import 'package:parcial_1/model/product_model.dart';


class CardWidget extends StatelessWidget {
  final ProductModel product;
  const CardWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            child: FadeInImage.assetNetwork(
              placeholder: 'img/loading.gif',
              image: product.images?.first ?? '',
              height: 250,
              width: double.infinity,
              fit: BoxFit.fill,
              imageErrorBuilder: (context, error, stackTrace) {
                return const SizedBox(
                  height: 150,
                  child: Center(child: Icon(Icons.no_photography)),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.all(80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 16),
                Text(
                  "\$${product.price}",
                  style: TextStyle(fontSize: 25, color: Colors.blue),
                ),

                const SizedBox(height: 16),
                Text(product.description),

                SizedBox(
                  height: 32,
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      router.pop();
                    },
                    child: Text("Regresar"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
