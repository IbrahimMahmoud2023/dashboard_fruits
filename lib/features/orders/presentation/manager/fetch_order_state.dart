

import 'package:flutter/material.dart';

import '../../domain/entites/order_entity.dart';

@immutable
sealed class FetchOrderState {}

final class FetchOrderInitial extends FetchOrderState {}
final class FetchOrderLoading extends FetchOrderState {}
final class FetchOrderSuccess extends FetchOrderState {
  final List<OrderEntity> orders;
  FetchOrderSuccess({required this.orders});
}
final class FetchOrderFailure extends FetchOrderState {
  final String errorMessage;
  FetchOrderFailure({required this.errorMessage});
}
