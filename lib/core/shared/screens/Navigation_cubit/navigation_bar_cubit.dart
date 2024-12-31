import 'package:bloc/bloc.dart';

class NavigationBarCubit extends Cubit<int> {
  NavigationBarCubit() : super(2);
  void choosePage(int index) {
    emit(index);
  }
}
