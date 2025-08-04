import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/products_providers.dart';
import '../widgets/product_card.dart';
import '../../../../app/router/routes.dart';
import '../../../../shared/widgets/loading_widget.dart';
import '../../../../shared/widgets/error_widget.dart';

class ProductsListPage extends ConsumerWidget {
  const ProductsListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(productsListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Prodotti'),
        actions: [
          IconButton(
            onPressed: () {
              // Refresh manuale
              ref.read(productsRefreshProvider.notifier).state++;
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: productsAsync.when(
        data: (products) {
          if (products.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.inventory_2_outlined,
                    size: 64,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Nessun prodotto trovato',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Aggiungi il primo prodotto premendo il pulsante +',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              ref.read(productsRefreshProvider.notifier).state++;
              return ref.read(productsListProvider.future);
            },
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCard(
                  product: product,
                  onTap: () => context.push('${Routes.productDetail}/${product.id}'),
                );
              },
            ),
          );
        },
        loading: () => LoadingWidget(),
        error: (error, stack) => CustomErrorWidget(
          error: error.toString(),
          onRetry: () {
            ref.read(productsRefreshProvider.notifier).state++;
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(Routes.productForm),
        tooltip: 'Aggiungi Prodotto',
        child: Icon(Icons.add),
      ),
    );
  }
}