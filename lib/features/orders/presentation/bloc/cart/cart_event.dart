import 'package:equatable/equatable.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class AddCartItemEvent extends CartEvent {
  final CartItemModel item;

  const AddCartItemEvent(this.item);

  @override
  List<Object?> get props => [item];
}

class UpdateCartItemQuantityEvent extends CartEvent {
  final int quantity;
  final CartItemModel item;

  const UpdateCartItemQuantityEvent(this.item, this.quantity);

  @override
  List<Object?> get props => [item, quantity];
}

class RemoveCartItemEvent extends CartEvent {
  final CartItemModel item;

  const RemoveCartItemEvent(this.item);

  @override
  List<Object?> get props => [item];
}

class ClearCartEvent extends CartEvent {}
