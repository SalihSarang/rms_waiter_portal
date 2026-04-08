import 'package:equatable/equatable.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

class CartState extends Equatable {
  final List<CartItemModel> items;
  final bool isLoading;
  final String? errorMessage;
  final bool isOrderSubmitted;

  const CartState({
    this.items = const [],
    this.isLoading = false,
    this.errorMessage,
    this.isOrderSubmitted = false,
  });

  double get cartTotal =>
      items.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  int get itemCount => items.fold(0, (sum, item) => sum + item.quantity);

  CartState copyWith({
    List<CartItemModel>? items,
    bool? isLoading,
    String? errorMessage,
    bool? isOrderSubmitted,
  }) {
    return CartState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      isOrderSubmitted: isOrderSubmitted ?? this.isOrderSubmitted,
    );
  }

  @override
  List<Object?> get props => [items, isLoading, errorMessage, isOrderSubmitted];
}
