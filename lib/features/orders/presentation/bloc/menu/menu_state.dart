import 'package:equatable/equatable.dart';
import 'package:rms_shared_package/models/menu_models/category_model/category_model.dart';
import 'package:rms_shared_package/models/menu_models/food_model/food_model.dart';

abstract class MenuState extends Equatable {
  const MenuState();

  @override
  List<Object?> get props => [];
}

class MenuInitial extends MenuState {}

class MenuLoading extends MenuState {}

class MenuLoaded extends MenuState {
  final List<CategoryModel> categories;
  final List<FoodModel> foods;

  const MenuLoaded({required this.categories, required this.foods});

  @override
  List<Object?> get props => [categories, foods];
}

class MenuError extends MenuState {
  final String message;
  const MenuError(this.message);

  @override
  List<Object?> get props => [message];
}
