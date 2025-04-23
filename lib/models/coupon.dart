class Coupon {
  final String code;
  final double discountPercent;
  final DateTime expiryDate;

  Coupon({
    required this.code,
    required this.discountPercent,
    required this.expiryDate,
  });
}
