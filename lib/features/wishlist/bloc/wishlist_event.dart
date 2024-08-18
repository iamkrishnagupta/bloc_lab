part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class WishlistRemoveButtonClickedEvent extends WishlistEvent {
  final ProductDataModel product;
  WishlistRemoveButtonClickedEvent({required this.product});
}
