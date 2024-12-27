import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

// part 'counter_state.dart';
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
  void increment() => emit(state + 1);
  void decrement() {
    if (state > 1) {
      emit(state - 1);
    }
  }
}
