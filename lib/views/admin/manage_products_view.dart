import 'package:flutter/material.dart';
import '../../providers/product_provider.dart';
import 'package:provider/provider.dart';

class ManageProductsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductProvider>(context).products;

    return Scaffold(
      appBar: AppBar(title: Text('Gérer les produits')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (ctx, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('${product.price} DT'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                Provider.of<ProductProvider>(context, listen: false)
                    .deleteProduct(product.id);
              },
            ),
          );
        },
      ),
    );
  }
}
