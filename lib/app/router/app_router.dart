import 'package:flutter_app_01/features/auth/presentation/pages/auth_test_page.dart' show AuthTestPage;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/products/presentation/pages/products_list_page.dart';
import '../../features/products/presentation/pages/product_detail_page.dart';
import 'routes.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: Routes.authTest, // Per ora iniziamo dal test
    routes: [
      // Auth Routes
      GoRoute(
        path: Routes.authTest,
        builder: (context, state) => AuthTestPage(),
      ),
      // Products Routes
      GoRoute(
        path: Routes.products,
        builder: (context, state) => ProductsListPage(),
      ),
      GoRoute(
        path: '${Routes.productDetail}/:id',
        builder: (context, state) {
          final id = int.parse(state.pathParameters['id']!);
          return ProductDetailPage(productId: id);
        },
      ),
      // GoRoute(
      //   path: Routes.productForm,
      //   builder: (context, state) {
      //     final productId = state.uri.queryParameters['id'];
      //     return ProductFormPage(
      //       productId: productId != null ? int.parse(productId) : null,
      //     );
      //   },
      // ),
    ],
  );
});
