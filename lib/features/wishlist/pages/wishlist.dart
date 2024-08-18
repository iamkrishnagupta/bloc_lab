import 'package:bloc_lab/features/wishlist/pages/wishlist_tile_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter/material.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Wishlist'),
        ),
        body: BlocConsumer<WishlistBloc, WishlistState>(
          bloc: wishlistBloc,
          listenWhen: (previous, current) => current is WishlistActionState,
          buildWhen: (previous, current) => current is! WishlistActionState,
          listener: (context, state) {
            if (state is ProductRemovedFromWishlistActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Product removed from wishlist!'),
            ),
          );
        }
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case const (WishlistSuccessState):
                return ListView.builder(
                  itemCount:
                      (state as WishlistSuccessState).wishlistItems.length,
                  itemBuilder: (context, index) {
                    return WishlistTile(
                      productDataModel: state.wishlistItems[index],
                      wishlistBloc: wishlistBloc,
                    );
                  },
                );
            }
            return const SizedBox();
          },
        ));
  }
}
