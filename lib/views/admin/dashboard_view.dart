import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Dashboard')),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          _buildCard(context, 'Produits', Icons.shop, '/admin/products'),
          _buildCard(context, 'Promotions', Icons.local_offer, '/admin/promotions'),
          _buildCard(context, 'Commandes', Icons.list, '/admin/orders'),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, IconData icon, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Card(
        elevation: 4,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 40),
              SizedBox(height: 10),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
