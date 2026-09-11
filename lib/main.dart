void processOrder({
  required int orderId,
  required double itemPrice,
  String? promoCode,
  double? deliveryFee
}) {
  double price = itemPrice;
  if (promoCode == 'SAVE10') price *= 0.9;

  double fee = deliveryFee ?? 500.0;
  if (fee < 500.0) fee = 500.0;
  double total = price + fee;

  print('Summary for #$orderId: Price: $itemPrice, Promo: $promoCode, Fee: $fee, Total: $total');
}

//

void checkBalance({
  required String name,
  required double balance,
}) {
  print('$name Доступный баланс: $balance');
}

double deposit({
  required double currentBalance,
  double? amount,
}) {
  double depositAmount = amount ?? 0.0;
  double newBalance = currentBalance + depositAmount;
  print('Пополнение: $depositAmount. Новый баланс: $newBalance');
  return newBalance;
}

double withdraw({
  required String name,
  required double currentBalance,
  double? amount,
  int? pinCode,
}) {
  int inputPin = pinCode ?? 0000;
  if (inputPin != 1234) {
    print('Ошибка: Неверный пин-код. Транзакция отклонена.');
    return currentBalance;
  }

  double withdrawAmount = amount ?? 0.0;
  if (withdrawAmount > currentBalance) {
    print('Ошибка: Недостаточно средств. Транзакция отклонена.');
    return currentBalance;
  }

  double newBalance = currentBalance - withdrawAmount;
  print('Снятие: $withdrawAmount. Остаток: $newBalance');
  return newBalance;
}

void main () {
  // processOrder(orderId: 1, itemPrice: 1000.0);
  // processOrder(orderId: 2, itemPrice: 2000.0, promoCode: 'SAVE10');
  // processOrder(orderId: 3, itemPrice: 3000.0, deliveryFee: 0.0);
  // processOrder(orderId: 4, itemPrice: 3000.0, deliveryFee: 700.0);

  double balance = 100.0;
  String user = 'Amir';

  checkBalance(name: user, balance: balance);

  balance = deposit(currentBalance: balance, amount: 50.0);
  balance = deposit(currentBalance: balance, amount: null);

  balance = withdraw(name: user, currentBalance: balance, amount: 30.0, pinCode: 1234);
  balance = withdraw(name: user, currentBalance: balance, amount: 200.0, pinCode: 1234);
  balance = withdraw(name: user, currentBalance: balance, amount: 20.0, pinCode: 0000);
}
