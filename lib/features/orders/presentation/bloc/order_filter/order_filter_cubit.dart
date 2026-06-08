import 'package:flutter_bloc/flutter_bloc.dart';
import 'order_filter_state.dart';

import '../../../domain/enums/order_filter.dart';

class OrderFilterCubit extends Cubit<OrderFilterState> {
  OrderFilterCubit() : super(OrderFilterState.initial());

  void setFilter(OrderFilter filter) {
    emit(state.copyWith(selectedFilter: filter));
  }
}
