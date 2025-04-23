import 'package:flutter/material.dart';
import '../../models/order.dart';

class OrdersView extends StatelessWidget {
  final List<Order> adminOrders = []; // could be filled via provider or mock

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Commandes')),
      body: adminOrders.isEmpty
          ? Center(child: Text('Aucune commande'))
          : ListView.builder(
              itemCount: adminOrders.length,
              itemBuilder: (ctx, index) {
                final order = adminOrders[index];
                return ListTile(
                  title: Text('Commande ${order.id}'),
                  subtitle: Text('${order.total} DT - ${order.status}'),
                );
              },
            ),
    );
  }
}
