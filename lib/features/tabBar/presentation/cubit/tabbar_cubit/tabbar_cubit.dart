import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tabbar_state.dart';

class TabbarCubit extends Cubit<TabbarState> {
  TabbarCubit() : super(const SelectedIndex(0));

  void updateCurrentPage(int index) {
    emit(SelectedIndex(index));
  }
}
