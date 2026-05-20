import 'package:rms_shared_package/rms_shared_package.dart';

import '../../../../../domain/enums/order_filter.dart';

class OrderFilterHelper {
  static List<OrderModel> filterOrders(
    List<OrderModel> orders,
    OrderFilter selectedFilter,
  ) {
    return orders.where((order) {
      // Never show cancelled orders
      if (order.orderStatus == OrderStatus.cancelled) return false;

      if (selectedFilter == OrderFilter.all) {
        return order.orderStatus != OrderStatus.completed;
      }

      switch (selectedFilter) {
        case OrderFilter.pending:
          return order.orderStatus == OrderStatus.pending;
        case OrderFilter.preparing:
          return order.orderStatus == OrderStatus.preparing;
        case OrderFilter.ready:
          return order.orderStatus == OrderStatus.ready;
        case OrderFilter.billRequested:
          return order.orderStatus == OrderStatus.served;
        case OrderFilter.completed:
          return order.orderStatus == OrderStatus.completed;
        default:
          return true;
      }
    }).toList();
  }
}
