import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/cart_bloc.dart';
import 'package:flutter/material.dart';

import 'cart_tile_widget.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
        ),
        body: BlocConsumer<CartBloc, CartState>(
          bloc: cartBloc,
          listenWhen: (previous, current) => current is CartActionState,
          buildWhen: (previous, current) => current is! CartActionState,
          listener: (context, state) {},
          builder: (context, state) {
            switch (state.runtimeType) {
              case const (CartSuccessState):
                return ListView.builder(
                  itemCount: (state as CartSuccessState).cartItems.length,
                  itemBuilder: (context, index) {
                    return CartTile(
                      productDataModel: state.cartItems[index],
                      cartBloc: cartBloc,
                    );
                  },
                );
            }
            return const SizedBox();
          },
        ));
  }
}
