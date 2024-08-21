part of 'tabbar_cubit.dart';

abstract class TabbarState extends Equatable {
  final int index;
  const TabbarState(this.index);

  @override
  List<Object> get props => [index];
}

class SelectedIndex extends TabbarState {
  const SelectedIndex(int index) : super(index);
}
