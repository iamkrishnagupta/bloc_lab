import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../data/wishlist_items.dart';
import '../../home/data/model/home_product_datamodel.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistRemoveButtonClickedEvent>(wishlistRemoveButtonClickedEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }

  FutureOr<void> wishlistRemoveButtonClickedEvent(
      WishlistRemoveButtonClickedEvent event, Emitter<WishlistState> emit) {
    debugPrint('Remove item from Wishlist Clicked.');
    wishlistItems.remove(event.product);
    emit(ProductRemovedFromWishlistActionState());

    //note: emit a new state with the updated wishlist
    emit(WishlistSuccessState(wishlistItems: wishlistItems));


  }
}
