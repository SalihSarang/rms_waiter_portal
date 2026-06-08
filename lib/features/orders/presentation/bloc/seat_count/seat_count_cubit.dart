import 'package:flutter_bloc/flutter_bloc.dart';
import 'seat_count_state.dart';

class SeatCountCubit extends Cubit<SeatCountState> {
  SeatCountCubit() : super(SeatCountState.initial());

  void selectCount(int count) {
    emit(state.copyWith(selectedCount: count));
  }
}
