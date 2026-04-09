import 'package:rms_shared_package/rms_shared_package.dart';

class OrderFilterHelper {
  static List<OrderModel> filterOrders(
    List<OrderModel> orders,
    String selectedFilter,
  ) {
    return orders.where((order) {
      if (selectedFilter == 'All') {
        return order.orderStatus != OrderStatus.completed;
      }

      switch (selectedFilter.toLowerCase()) {
        case 'preparing':
          return order.orderStatus == OrderStatus.preparing;
        case 'ready':
          return order.orderStatus == OrderStatus.ready;
        case 'bill requested':
          return order.orderStatus == OrderStatus.served;
        case 'completed':
          return order.orderStatus == OrderStatus.completed;
        default:
          return true;
      }
    }).toList();
  }
}
