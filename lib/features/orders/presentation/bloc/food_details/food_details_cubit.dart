import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'package:waiter_portal/features/orders/domain/repositories/food_repository.dart';
import 'food_details_state.dart';

class FoodDetailsCubit extends Cubit<FoodDetailsState> {
  final FoodRepository _foodRepository;
  final String foodId;

  FoodDetailsCubit(this._foodRepository, this.foodId)
    : super(const FoodDetailsState(isLoading: true)) {
    fetchFoodDetails();
  }

  Future<void> fetchFoodDetails() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final food = await _foodRepository.getFoodById(foodId);
      if (food != null) {
        emit(state.copyWith(food: food, isLoading: false));
      } else {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: 'Food item not found.',
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: ErrorHandler.getFriendlyMessage(e),
        ),
      );
    }
  }

  void selectPortion(PortionAndPrice portion) {
    emit(state.copyWith(selectedPortion: portion, showPortionError: false));
  }

  void toggleAddOn(AddOnsModel addOn) {
    final List<AddOnsModel> currentAddOns = List.from(state.selectedAddOns);
    if (currentAddOns.contains(addOn)) {
      currentAddOns.remove(addOn);
    } else {
      currentAddOns.add(addOn);
    }
    emit(state.copyWith(selectedAddOns: currentAddOns));
  }

  void updateSpecialInstructions(String notes) {
    emit(state.copyWith(specialInstructions: notes));
  }

  void incrementQuantity() {
    emit(state.copyWith(quantity: state.quantity + 1));
  }

  void decrementQuantity() {
    if (state.quantity > 1) {
      emit(state.copyWith(quantity: state.quantity - 1));
    }
  }

  bool validateSelections() {
    if (state.selectedPortion == null) {
      emit(state.copyWith(showPortionError: true));
      return false;
    }
    return true;
  }
}
