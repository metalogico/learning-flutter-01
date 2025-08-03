import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state_management/product_state.dart';

class ProductListScreen extends ConsumerWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productProvider);

    Widget buildBody() {
      if (productState is ProductInitial || productState is ProductLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (productState is ProductSuccess) {
        return ListView.builder(
          itemCount: productState.products.length,
          itemBuilder: (context, index) {
            final product = productState.products[index];
            return ListTile(
              leading: Image.network(
                product.imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(product.name),
              subtitle: Text(
                product.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Text('\$${product.price.toStringAsFixed(2)}'),
            );
          },
        );
      } else if (productState is ProductError) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(productState.message),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ref.read(productProvider.notifier).getProducts();
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        );
      } else {
        // This case should not be reached with a sealed class
        return const Center(child: Text('An unexpected error occurred.'));
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Products (Riverpod)')),
      body: buildBody(),
    );
  }
}
