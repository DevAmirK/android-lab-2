void processOrder({
  required int orderId,
  required double itemPrice,
  String? promoCode,
  double? deliveryFee,
}) {
  double price = itemPrice;
  if (promoCode == 'SAVE10') price *= 0.9;

  double fee = deliveryFee ?? 500.0;
  if (fee < 500.0) fee = 500.0;
  double total = price + fee;

  print('Summary for #$orderId: Price: $itemPrice, Promo: $promoCode, Fee: $fee, Total: $total');
}

void main () {
  processOrder(orderId: 1, itemPrice: 1000.0);
  processOrder(orderId: 2, itemPrice: 2000.0, promoCode: 'SAVE10');
  processOrder(orderId: 3, itemPrice: 3000.0, deliveryFee: 0.0);
  processOrder(orderId: 4, itemPrice: 3000.0, deliveryFee: 700.0);
}
