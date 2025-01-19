import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationBarCubit extends Cubit<int> {
  NavigationBarCubit() : super(2);
  void choosePage(int index) {
    emit(index);
  }
}
