import 'package:flutter_bloc/flutter_bloc.dart';
import 'order_filter_state.dart';

class OrderFilterCubit extends Cubit<OrderFilterState> {
  OrderFilterCubit() : super(OrderFilterState.initial());

  void setFilter(String filter) {
    emit(state.copyWith(selectedFilter: filter));
  }
}
