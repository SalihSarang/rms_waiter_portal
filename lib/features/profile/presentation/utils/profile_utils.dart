import 'package:rms_shared_package/rms_shared_package.dart';

/// Utility class containing helper methods for profile data formatting and calculations.
class ProfileUtils {
  /// Formats a DateTime into a user-friendly string (e.g., "11:30 AM").
  static String formatTime(DateTime dateTime) {
    final hour = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final period = dateTime.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }

  /// Calculates the elapsed time since the startTime.
  static String calculateDuration(DateTime startTime) {
    final duration = DateTime.now().difference(startTime);
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;
    return '${hours}h ${minutes}m';
  }

  /// Formats UserRole names for cleaner UI display (e.g., "WAITER" -> "Waiter").
  static String formatRole(String role) {
    if (role.isEmpty) return 'Staff';
    return role[0].toUpperCase() + role.substring(1).toLowerCase();
  }

  /// Filters orders by staffId and createdAt (today), and sums the totalAmount.
  static String calculateTodaySales(List<OrderModel> orders, String staffId) {
    final now = DateTime.now();
    final todaySales = orders
        .where((order) => order.staffId == staffId)
        .where(
          (order) =>
              order.createdAt.year == now.year &&
              order.createdAt.month == now.month &&
              order.createdAt.day == now.day,
        )
        .fold(0.0, (sum, order) => sum + order.totalAmount);

    return '\$${todaySales.toStringAsFixed(2)}';
  }
}
