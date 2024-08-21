part of 'get_static_pages_cubit.dart';


abstract class GetStaticPagesState extends Equatable {

  const GetStaticPagesState();

  @override
  List<Object?> get props => <Object?>[];
}

class GetStaticPagesInitialState extends GetStaticPagesState {
  const GetStaticPagesInitialState();
}

class GetStaticPagesLoadingState extends GetStaticPagesState {
  const GetStaticPagesLoadingState();
}

class GetStaticPagesSuccessState extends GetStaticPagesState {
  final List<StaticPage> value;

  const GetStaticPagesSuccessState({required this.value});

  @override
  List<Object?> get props => <Object?>[value];
}

class GetStaticPagesErrorState extends GetStaticPagesState {
  final String message;

  const GetStaticPagesErrorState({required this.message,});

  @override
  List<Object?> get props => <Object?>[message];
}

