class PaymentService {
  Future<bool> simulatePayment(double amount) async {
    await Future.delayed(Duration(seconds: 2));
    return true; // always succeeds
  }
}
