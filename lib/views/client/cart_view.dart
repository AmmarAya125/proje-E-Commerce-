import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/cart_provider.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Panier')),
      body: cart.items.isEmpty
          ? Center(child: Text('Panier vide'))
          : Column(
              children: [
                Expanded(
                  child: ListView(
                    children: cart.items.values.map((item) {
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text('${item.price} DT x ${item.quantity}'),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => cart.removeItem(item.productId),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Text('Total: ${cart.totalPrice.toStringAsFixed(2)} DT'),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    cart.clearCart();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Commande passée ! (simulée)'),
                    ));
                  },
                  child: Text('Commander'),
                ),
              ],
            ),
    );
  }
}
