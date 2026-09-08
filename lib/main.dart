double processOrder({
  required int orderId,
  required double itemPrice,
  String? promoCode,
  double? deliveryFee,
}) {
  double price = itemPrice;
  if (promoCode == 'SAVE10') price *= 0.9;
  
  double fee = deliveryFee ?? 500.0;
  double total = price + fee;
  
  print('Order #$orderId: Price: $itemPrice, Promo: $promoCode, Fee: $fee, Total: $total');
  return total;
}

void main() {
  processOrder(orderId: 1, itemPrice: 1000.0);
  processOrder(orderId: 2, itemPrice: 2000.0, promoCode: 'SAVE10');
  processOrder(orderId: 3, itemPrice: 3000.0, promoCode: 'SAVE10', deliveryFee: 0.0);
}
