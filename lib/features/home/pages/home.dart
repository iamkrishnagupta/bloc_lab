import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cart/pages/cart.dart';
import '../../wishlist/pages/wishlist.dart';
import '../bloc/home_bloc.dart';
import 'product_tile_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    //passing the initial event to the bloc
    homeBloc.add(HomeInitialEvent());
  }

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
        //only build when not action state

        switch (state.runtimeType) {
          case const (HomeLoadingState):
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ); //return loading widget

          case const (HomeLoadedSuccessState):
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text('Bloc Hub'),
                actions: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(
                        HomeWishlistButtonNavigateEvent(),
                      );
                    },
                    icon: const Icon(Icons.favorite),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(
                        HomeCartButtonNavigateEvent(),
                      );
                    },
                    icon: const Icon(Icons.shopping_cart),
                  ),
                ],
              ),
              body: ListView.builder(
                  itemCount: (state as HomeLoadedSuccessState).products.length,
                  itemBuilder: (context, index) {
                    return ProductTile(
                      productDataModel: state.products[index], homeBloc: homeBloc,
                    );
                  }),
            );

          case const (HomeErrorState):
            return const Scaffold(
              body: Center(
                child: Text('Error'),
              ),
            );

          default:
            return const SizedBox(
              child: Center(
                child: Text('Pookie <3'),
              ),
            );
        }
      },
    );
  }
}
