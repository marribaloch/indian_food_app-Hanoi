final order = Order(
  id: id,
  restaurantId: restaurantId,
  items: cartItems.map((c) => c.item).toList(),
  totalVnd: total,
);
static void updateStatus(String orderId, String status) {
  final index = _orders.indexWhere((o) => o.id == orderId);
  if (index != -1) {
    _orders[index].status = status;
  }
}
