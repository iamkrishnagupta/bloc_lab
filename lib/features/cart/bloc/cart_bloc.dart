import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../data/cart_items.dart';
import '../../home/data/model/home_product_datamodel.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveButtonClickedEvent>(cartRemoveButtonClickedEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveButtonClickedEvent(
      CartRemoveButtonClickedEvent event, Emitter<CartState> emit) {
    debugPrint('Remove item from Cart Clicked.');
    cartItems.remove(event.product);
    emit(ProductRemovedFromCartActionState());

    //note: emit a new state with the updated cartlist
    emit(CartSuccessState(cartItems: cartItems));
  }
}
