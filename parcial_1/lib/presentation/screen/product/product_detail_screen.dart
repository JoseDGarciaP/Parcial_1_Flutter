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
          return const Scaffold(body: Center(child: Text("No disponible")));
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
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
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
                      errorBuilder: (context, error, stackTrace) => Center(
                        child: Icon(
                          Icons.broken_image,
                          size: 72,
                          color: colors.onSurface.withValues(alpha: 0.3),
                        ),
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
                                  ? colors.primary
                                  : colors.onSurface.withValues(alpha: 0.25),
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
                    backgroundColor: colors.secondary.withValues(alpha: 0.2),
                    labelStyle: TextStyle(
                      color: colors.primary,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    side: BorderSide.none,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    p.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: colors.onSurface,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '\$${p.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: colors.primary,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.star_rounded,
                        color: colors.tertiary,
                        size: 22,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${p.rating.toStringAsFixed(1)} / 5',
                        style: TextStyle(fontSize: 15, color: colors.onSurface),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        p.stock > 0
                            ? Icons.check_circle_outline
                            : Icons.cancel_outlined,
                        size: 18,
                        color: p.stock > 0 ? colors.primary : colors.error,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        p.stock > 0
                            ? '${p.stock} units available'
                            : 'Out of stock',
                        style: TextStyle(
                          color: p.stock > 0 ? colors.primary : colors.error,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 28,
                    thickness: 1,
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.2),
                  ),
                  Text(
                    'Descripción',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: colors.onSurface,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    p.description,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.6,
                      color: colors.onSurface.withValues(alpha: 0.75),
                    ),
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
          child: FilledButton.icon(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            label: const Text('Regresar'),
            style: FilledButton.styleFrom(
              minimumSize: const Size.fromHeight(48),
              backgroundColor: colors.primary,
              foregroundColor: colors.onPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
