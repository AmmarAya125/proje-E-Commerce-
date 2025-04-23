import 'package:flutter/material.dart';
import '../../models/order.dart';

class OrderView extends StatelessWidget {
  final List<Order> mockOrders = [
    Order(
      id: '1',
      userId: 'user01',
      items: [],
      createdAt: DateTime.now(),
      total: 100,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mes commandes')),
      body: ListView.builder(
        itemCount: mockOrders.length,
        itemBuilder: (ctx, index) {
          final order = mockOrders[index];
          return ListTile(
            title: Text('Commande #${order.id}'),
            subtitle: Text(
              '${order.total.toStringAsFixed(2)} DT - ${order.createdAt.toLocal()}',
            ),
          );
        },
      ),
    );
  }
}
