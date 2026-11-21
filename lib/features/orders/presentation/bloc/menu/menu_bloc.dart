import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_shared_package/models/menu_models/category_model/category_model.dart';
import 'package:rms_shared_package/models/menu_models/food_model/food_model.dart';
import '../../../domain/usecases/get_categories.dart';
import '../../../domain/usecases/get_food_items.dart';
import 'menu_event.dart';
import 'menu_state.dart';

/// [MenuBloc] handles the fetching and managing of the core menu data.
///
/// Coordinates with UseCases to fetch [CategoryModel] and [FoodModel]
/// items concurrently from the remote data source.
class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final GetCategories _getCategories;
  final GetFoodItems _getFoodItems;

  MenuBloc(this._getCategories, this._getFoodItems) : super(MenuInitial()) {
    on<FetchMenu>(_onFetchMenu);
  }

  Future<void> _onFetchMenu(FetchMenu event, Emitter<MenuState> emit) async {
    emit(MenuLoading());
    try {
      // Execute category and food item queries in parallel to halve network wait time
      final results = await Future.wait([
        _getCategories(),
        _getFoodItems(),
      ]);

      final categories = results[0] as List<CategoryModel>;
      final foods = results[1] as List<FoodModel>;

      emit(MenuLoaded(categories: categories, foods: foods));
    } catch (e) {
      emit(MenuError(e.toString()));
    }
  }
}
