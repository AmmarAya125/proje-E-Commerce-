import 'package:flutter/material.dart';
import '../../models/product.dart';
import '../../providers/cart_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailsView extends StatelessWidget {
  final Product product;

  ProductDetailsView({required this.product});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(product.imageUrl),
            SizedBox(height: 10),
            Text(product.description),
            SizedBox(height: 10),
            Text('${product.price} DT'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                cart.addItem(product.id, product.name, product.price);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Ajouté au panier'),
                ));
              },
              child: Text('Ajouter au panier'),
            ),
          ],
        ),
      ),
    );
  }
}
