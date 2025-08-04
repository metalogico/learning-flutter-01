import 'package:flutter/material.dart';
import 'package:flutter_app_01/features/products/presentation/providers/products_providers.dart';
import 'package:flutter_app_01/shared/widgets/error_widget.dart';
import 'package:flutter_app_01/shared/widgets/loading_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProductDetailPage extends ConsumerWidget {
  final int productId;

  const ProductDetailPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productDetailProvider(productId));

    return productAsync.when(
      loading: () => Scaffold(body: LoadingWidget()),
      error: (error, stack) =>
          Scaffold(body: CustomErrorWidget(error: error.toString())),
      data: (product) => Scaffold(
        body: CustomScrollView(
          slivers: [
            // App Bar con immagine
            SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: 300,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: 'product-image-${product.id}',
                  child: Image.network(
                    product.thumbnail,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey[300],
                      child: Icon(
                        Icons.image_not_supported,
                        size: 100,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ),
              ),
              leading: IconButton(
                onPressed: () => context.pop(),
                icon: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.5),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
              actions: [],
            ),

            // Contenuto del prodotto
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header con nome e prezzo
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: Theme.of(context).textTheme.headlineSmall
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade100,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.blue.shade300,
                                  ),
                                ),
                                child: Text(
                                  product.category.toString().toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.blue[700],
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '€${product.price}',
                              style: Theme.of(context).textTheme.headlineMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: product.price > 1000
                                        ? Colors.red
                                        : Colors.green,
                                  ),
                            ),
                            if (product.price > 1000)
                              Text(
                                'Premium',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 24),

                    // Rating e recensioni (placeholder)
                    Row(
                      children: [
                        Row(
                          children: List.generate(5, (index) {
                            return Icon(
                              index < 5 ? Icons.star : Icons.star_border,
                              color: Colors.amber,
                              size: 20,
                            );
                          }),
                        ),
                        SizedBox(width: 8),
                        Text(
                          '5.0 (3 recensioni)',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: Colors.grey[600]),
                        ),
                      ],
                    ),

                    SizedBox(height: 24),

                    // Descrizione
                    Text(
                      'Descrizione',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      product.description,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        height: 1.6,
                        color: Colors.grey[800],
                      ),
                    ),

                    SizedBox(height: 32),

                    // Specifiche tecniche (placeholder)
                    Text(
                      'Specifiche',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 16),

                    _buildSpecRow('Marca', product.brand ?? 'N/A'),
                    _buildSpecRow('Categoria', product.category),
                    _buildSpecRow('Disponibilità', 'In Stock'),
                    _buildSpecRow('SKU', 'PRD-${product.id}'),

                    SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
          ),
          Expanded(
            child: Text(value, style: TextStyle(fontWeight: FontWeight.w400)),
          ),
        ],
      ),
    );
  }
}
