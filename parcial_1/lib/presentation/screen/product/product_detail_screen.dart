import 'package:flutter/material.dart';
import 'package:parcial_1/model/product_model.dart';
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
          return const Scaffold(
            body: Center(child: Text("No disponible")),
          );
        }

        final p = snapshot.data!;
        final images = p.images.isNotEmpty ? p.images : [p.thumbnail];

        return _DetailView(p: p, images: images);
      },
    );
  }
}

class _DetailView extends StatefulWidget {
  final ProductModel p;
  final List<String> images;

  const _DetailView({required this.p, required this.images});

  @override
  State<_DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<_DetailView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.p;
    final images = widget.images;

    return Scaffold(
      appBar: AppBar(
        title: Text(p.title, overflow: TextOverflow.ellipsis),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Carrusel de imágenes
            SizedBox(
              height: 280,
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _pageController,
                    itemCount: images.length,
                    onPageChanged: (i) => setState(() => _currentPage = i),
                    itemBuilder: (_, i) => Image.network(
                      images[i],
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => const Center(
                        child: Icon(Icons.broken_image, size: 72, color: Colors.grey),
                      ),
                    ),
                  ),
                  if (images.length > 1)
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(images.length, (i) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            width: _currentPage == i ? 16 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: _currentPage == i
                                  ? Theme.of(context).colorScheme.primary
                                  : Colors.grey.shade400,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          );
                        }),
                      ),
                    ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Chip(
                    label: Text(p.category),
                    visualDensity: VisualDensity.compact,
                    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                    labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    p.title,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '\$${p.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.star_rounded, color: Colors.amber, size: 22),
                      const SizedBox(width: 4),
                      Text(
                        '${p.rating.toStringAsFixed(1)} / 5',
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        p.stock > 0 ? Icons.check_circle_outline : Icons.cancel_outlined,
                        size: 18,
                        color: p.stock > 0 ? Colors.green : Colors.red,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        p.stock > 0 ? '${p.stock} unidades disponibles' : 'Sin stock',
                        style: TextStyle(
                          color: p.stock > 0 ? Colors.green : Colors.red,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 28),
                  const Text(
                    'Descripción',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    p.description,
                    style: const TextStyle(fontSize: 14, height: 1.6, color: Colors.black87),
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ],
        ),
      ),
  
    );
  }
}