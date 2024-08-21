import 'package:flutter_bloc/flutter_bloc.dart';

import 'loundary_orders_state.dart';

class LaundryOrdersCubit extends Cubit<LaundryOrdersState> {
  LaundryOrdersCubit() : super(OrdersInitial());

  changeOrdersType(String type){
  if(type=='current'){
    emit(CurrentOrders());
  }else if(type=='finished'){
    emit(FinishedOrders());
  }else{
    emit(CanceledOrders());
  }
  }
}