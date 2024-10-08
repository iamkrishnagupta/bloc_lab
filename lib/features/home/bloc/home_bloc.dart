import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../home/data/model/home_product_datamodel.dart';
import '/data/cart_items.dart';
import '/data/food_items.dart';
import '/data/wishlist_items.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(_onInitial);
    on<HomeWishlistButtonNavigateEvent>(_onWishlistNavigate);
    on<HomeCartButtonNavigateEvent>(_onCartNavigate);
    on<HomeWishlistButtonClickedEvent>(_onWishlistButtonClicked);
    on<HomeCartButtonClickedEvent>(_onCartButtonClicked);
  }

  FutureOr<void> _onInitial(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    //first state will be loading state
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    emit(
      HomeLoadedSuccessState(
        products: FoodData.products
            .map(
              (e) => ProductDataModel(
                id: e['id'],
                description: e['description'],
                imageUrl: e['imageUrl'],
                price: e['price'],
                name: e['name'],
              ),
            )
            .toList(),
      ),
    );
  }

  FutureOr<void> _onWishlistNavigate(
      HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    debugPrint('Wishlist Navigate clicked');
    emit(HomeNavigateToWishlistActionState());
  }

  FutureOr<void> _onCartNavigate(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    debugPrint('Cart Navigate clicked');
    emit(HomeNavigateToCartActionState());
  }

  FutureOr<void> _onWishlistButtonClicked(
      HomeWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    debugPrint('Add Item to Wishlist Clicked.');
    wishlistItems.add(event.product);
    emit(HomeProductAddedToWishlistActionState());
  }

  FutureOr<void> _onCartButtonClicked(
      HomeCartButtonClickedEvent event, Emitter<HomeState> emit) {
    debugPrint('Add Item to Cart Clicked.');
    cartItems.add(event.product);
    emit(HomeProductAddedToCartActionState());
  }
}
