enum OrderFilter { all, pending, preparing, ready, billRequested, completed }

extension OrderFilterExtension on OrderFilter {
  String get displayName {
    switch (this) {
      case OrderFilter.all:
        return 'All';
      case OrderFilter.pending:
        return 'Pending';
      case OrderFilter.preparing:
        return 'Preparing';
      case OrderFilter.ready:
        return 'Ready';
      case OrderFilter.billRequested:
        return 'Bill Requested';
      case OrderFilter.completed:
        return 'Completed';
    }
  }
}
