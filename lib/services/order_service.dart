import '../models/order.dart';

class OrderService {
  final List<Order> _orders = [];

  Future<void> placeOrder(Order order) async {
    _orders.add(order);
    await Future.delayed(Duration(milliseconds: 300));
  }

  Future<List<Order>> getOrdersForUser(String userId) async {
    return _orders.where((o) => o.userId == userId).toList();
  }
}
