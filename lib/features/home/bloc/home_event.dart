part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}


//add your events, could add more if you want

class HomeInitialEvent extends HomeEvent {}

class HomeWishlistButtonClickedEvent extends HomeEvent {
  final ProductDataModel product;
  HomeWishlistButtonClickedEvent({required this.product});
}

class HomeCartButtonClickedEvent extends HomeEvent {
   final ProductDataModel product;
  HomeCartButtonClickedEvent({required this.product});
}

class HomeWishlistButtonNavigateEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}