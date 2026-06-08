import 'package:equatable/equatable.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

class FoodDetailsState extends Equatable {
  final FoodModel? food;
  final PortionAndPrice? selectedPortion;
  final List<AddOnsModel> selectedAddOns;
  final String specialInstructions;
  final int quantity;
  final bool showPortionError;
  final bool isLoading;
  final String? errorMessage;

  const FoodDetailsState({
    this.food,
    this.selectedPortion,
    this.selectedAddOns = const [],
    this.specialInstructions = '',
    this.quantity = 1,
    this.showPortionError = false,
    this.isLoading = false,
    this.errorMessage,
  });

  FoodDetailsState copyWith({
    FoodModel? food,
    PortionAndPrice? selectedPortion,
    List<AddOnsModel>? selectedAddOns,
    String? specialInstructions,
    int? quantity,
    bool? showPortionError,
    bool? isLoading,
    String? errorMessage,
  }) {
    return FoodDetailsState(
      food: food ?? this.food,
      selectedPortion: selectedPortion ?? this.selectedPortion,
      selectedAddOns: selectedAddOns ?? this.selectedAddOns,
      specialInstructions: specialInstructions ?? this.specialInstructions,
      quantity: quantity ?? this.quantity,
      showPortionError: showPortionError ?? this.showPortionError,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    food,
    selectedPortion,
    selectedAddOns,
    specialInstructions,
    quantity,
    showPortionError,
    isLoading,
    errorMessage,
  ];
}
