import 'package:rms_shared_package/rms_shared_package.dart';

class OrderFooterLogic {
  final OrderModel order;

  OrderFooterLogic(this.order);

  bool get isPreparing => order.orderStatus == OrderStatus.preparing;

  bool get hasNewItems =>
      order.orderedMenu.any((item) => !item.isSentToKitchen);

  bool get showSendToKitchen => order.orderStatus != OrderStatus.completed;

  bool get canSendToKitchen => !isPreparing && hasNewItems;

  bool get canAddMore => !isPreparing;
}
