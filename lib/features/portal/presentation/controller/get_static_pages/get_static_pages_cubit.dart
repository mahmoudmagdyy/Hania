import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/utils/values/strings.dart';
import '../../../domain/usecases/get_static_pages_usecase.dart';
import '../../../domain/entities/get_static_pages_response.dart';

part 'get_static_pages_states.dart';

class GetStaticPagesCubit extends Cubit<GetStaticPagesState> {
  final GetStaticPagesUseCase getStaticPagesUseCase;

  GetStaticPagesCubit(this.getStaticPagesUseCase) : super(const GetStaticPagesInitialState());

  List<StaticPage> data = <StaticPage>[];

  Future<void> fGetStaticPages({
   int? pageId,
   String? slug,
  }) async {
    emit(const GetStaticPagesLoadingState());
    final Either<Failure, GetStaticPagesResponse> eitherResult = await getStaticPagesUseCase(GetStaticPagesParams(
      pageId: pageId,
      slug: slug,
    ));
    eitherResult.fold((Failure failure) {
      emit(GetStaticPagesErrorState(message: failure.message?? Strings.pleaseTryAgainLater));
    }, (GetStaticPagesResponse response) {
      for(StaticPage itemResponse in response.data){
        for(StaticPage item in data){
          if(item.id == itemResponse.id){
            data.remove(item);
          }
        }
        data.add(itemResponse);
      }
      emit(GetStaticPagesSuccessState(value: data));
    });
  }

  StaticPage? getPageBySlug(String slug){
    for(StaticPage item in data){
      if(item.slug == slug){
        return item;
      }
    }
    return null;
  }
}

