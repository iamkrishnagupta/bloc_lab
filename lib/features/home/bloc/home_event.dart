part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}


//add your events, could add more if you want

class HomeWishlistButtonClickedEvent extends HomeEvent {}

class HomeCartButtonClickedEvent extends HomeEvent {}

class HomeWishlistButtonNavigateEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}