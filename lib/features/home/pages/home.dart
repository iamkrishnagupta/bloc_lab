

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cart/pages/cart.dart';
import '../../wishlist/pages/wishlist.dart';
import '../bloc/home_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToWishlistActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Cart(),
            ),
          );
        } else if (state is HomeNavigateToCartActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Wishlist(),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(centerTitle: true, title: Text('Bloc Hub'), actions: [
            IconButton(
              onPressed: () {
                homeBloc.add(HomeWishlistButtonNavigateEvent());
              },
              icon: Icon(Icons.favorite),
            ),
            IconButton(
              onPressed: () {
                homeBloc.add(HomeCartButtonNavigateEvent());
              },
              icon: Icon(Icons.shopping_cart),
            ),
          ]),
        );
      },
    );
  }
}
