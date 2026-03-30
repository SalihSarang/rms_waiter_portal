import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_categories.dart';
import '../../../domain/usecases/get_food_items.dart';
import 'menu_event.dart';
import 'menu_state.dart';

/// [MenuBloc] handles the fetching and managing of the core menu data.
///
/// It coordinates with UseCases to fetch [CategoryModel] and [FoodModel]
/// items from the remote data source.
class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final GetCategories _getCategories;
  final GetFoodItems _getFoodItems;

  MenuBloc(this._getCategories, this._getFoodItems) : super(MenuInitial()) {
    on<FetchMenu>(_onFetchMenu);
  }

  Future<void> _onFetchMenu(FetchMenu event, Emitter<MenuState> emit) async {
    emit(MenuLoading());
    try {
      final categories = await _getCategories();
      final foods = await _getFoodItems();
      emit(MenuLoaded(categories: categories, foods: foods));
    } catch (e) {
      emit(MenuError(e.toString()));
    }
  }
}
