part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemoveButtonClickedEvent extends CartEvent {
  final ProductDataModel product;
  CartRemoveButtonClickedEvent({required this.product});

}