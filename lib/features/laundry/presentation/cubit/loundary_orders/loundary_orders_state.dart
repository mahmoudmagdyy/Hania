import 'package:equatable/equatable.dart';

abstract class LaundryOrdersState extends Equatable {
  const LaundryOrdersState();

  @override
  List<Object> get props => [];
}

class OrdersInitial extends LaundryOrdersState {}

final class CurrentOrders extends LaundryOrdersState {}

final class FinishedOrders extends LaundryOrdersState {}

final class CanceledOrders extends LaundryOrdersState {}
