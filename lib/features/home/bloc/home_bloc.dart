import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeWishlistButtonNavigateEvent>(_onLikeNavigate);
    on<HomeCartButtonNavigateEvent>(_onCartNavigate);
    on<HomeWishlistButtonClickedEvent>(_onLikeButtonClicked);
    on<HomeCartButtonClickedEvent>(_onCartButtonClicked);
  }

  FutureOr<void> _onLikeNavigate(
      HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    debugPrint('Like Navigate clicked');
    emit(HomeNavigateToWishlistActionState());
  }

  FutureOr<void> _onCartNavigate(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    debugPrint('Cart Navigate clicked');
    emit(HomeNavigateToCartActionState());
  }

  FutureOr<void> _onLikeButtonClicked(
      HomeWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    debugPrint('Like Button clicked');
  }

  FutureOr<void> _onCartButtonClicked(
      HomeCartButtonClickedEvent event, Emitter<HomeState> emit) {
    debugPrint('Cart Button clicked');
  }
}
