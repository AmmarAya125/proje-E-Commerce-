import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

// Providers
import 'providers/auth_provider.dart';
import 'providers/cart_provider.dart';
import 'providers/product_provider.dart';

// Client Views
import 'views/client/home_view.dart';
import 'views/client/cart_view.dart';
import 'views/client/order_view.dart';
import 'views/client/product_details_view.dart';

// Admin Views
import 'views/admin/dashboard_view.dart';
import 'views/admin/manage_products_view.dart';
import 'views/admin/orders_view.dart';
import 'views/admin/promotions_view.dart';

import 'models/product.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        initialRoute: '/',
        routes: {
          '/': (ctx) => HomeView(),
          '/cart': (ctx) => CartView(),
          '/orders': (ctx) => OrderView(),
          '/admin': (ctx) => DashboardView(),
          '/admin/products': (ctx) => ManageProductsView(),
          '/admin/orders': (ctx) => OrdersView(),
          '/admin/promotions': (ctx) => PromotionsView(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/product-details') {
            final product = settings.arguments as Product;
            return MaterialPageRoute(
              builder: (ctx) => ProductDetailsView(product: product),
            );
          }
          return null;
        },
      ),
    );
  }
}
