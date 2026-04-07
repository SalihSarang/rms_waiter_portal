import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<AddCartItemEvent>(_onAddItem);
    on<UpdateCartItemQuantityEvent>(_onUpdateQuantity);
    on<RemoveCartItemEvent>(_onRemoveItem);
    on<ClearCartEvent>(_onClearCart);
  }

  void _onAddItem(AddCartItemEvent event, Emitter<CartState> emit) {
    final List<CartItemModel> currentItems = List.from(state.items);

    // Check if an identical item already exists (same food, portion, addons, instructions)
    final existingIndex = currentItems.indexWhere(
      (item) => _isSameItem(item, event.item),
    );

    if (existingIndex != -1) {
      final existingItem = currentItems[existingIndex];
      currentItems[existingIndex] = CartItemModel(
        foodId: existingItem.foodId,
        name: existingItem.name,
        quantity: existingItem.quantity + event.item.quantity,
        price: existingItem.price,
        selectedPortion: existingItem.selectedPortion,
        selectedAddOns: existingItem.selectedAddOns,
        specialInstructions: existingItem.specialInstructions,
        imageUrl: existingItem.imageUrl,
      );
    } else {
      currentItems.add(event.item);
    }

    emit(state.copyWith(items: currentItems));
  }

  void _onUpdateQuantity(
    UpdateCartItemQuantityEvent event,
    Emitter<CartState> emit,
  ) {
    final List<CartItemModel> currentItems = List.from(state.items);
    final index = currentItems.indexWhere(
      (item) => _isSameItem(item, event.item),
    );

    if (index != -1) {
      if (event.quantity > 0) {
        final item = currentItems[index];
        currentItems[index] = CartItemModel(
          foodId: item.foodId,
          name: item.name,
          quantity: event.quantity,
          price: item.price,
          selectedPortion: item.selectedPortion,
          selectedAddOns: item.selectedAddOns,
          specialInstructions: item.specialInstructions,
          imageUrl: item.imageUrl,
        );
      } else {
        currentItems.removeAt(index);
      }
      emit(state.copyWith(items: currentItems));
    }
  }

  void _onRemoveItem(RemoveCartItemEvent event, Emitter<CartState> emit) {
    final List<CartItemModel> currentItems = List.from(state.items);
    currentItems.removeWhere((item) => _isSameItem(item, event.item));
    emit(state.copyWith(items: currentItems));
  }

  void _onClearCart(ClearCartEvent event, Emitter<CartState> emit) {
    emit(const CartState());
  }

  bool _isSameItem(CartItemModel item1, CartItemModel item2) {
    if (item1.foodId != item2.foodId) return false;
    if (item1.selectedPortion?.name != item2.selectedPortion?.name) {
      return false;
    }
    if (item1.specialInstructions != item2.specialInstructions) return false;

    if (item1.selectedAddOns.length != item2.selectedAddOns.length) {
      return false;
    }

    final addOnNames1 = item1.selectedAddOns.map((e) => e.name).toList()
      ..sort();
    final addOnNames2 = item2.selectedAddOns.map((e) => e.name).toList()
      ..sort();

    for (int i = 0; i < addOnNames1.length; i++) {
      if (addOnNames1[i] != addOnNames2[i]) return false;
    }

    return true;
  }
}
