class OrderItem {
  final String productId;
  final int quantity;

  OrderItem({required this.productId, required this.quantity});
}

class Order {
  final String id;
  final String userId;
  final List<OrderItem> items;
  final DateTime createdAt;
  final double total;
  final String status;

  Order({
    required this.id,
    required this.userId,
    required this.items,
    required this.createdAt,
    required this.total,
    this.status = 'pending',
  });
}
