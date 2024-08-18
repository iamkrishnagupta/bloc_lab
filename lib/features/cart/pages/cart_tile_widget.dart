import '../../home/data/model/home_product_datamodel.dart';
import '/features/cart/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';

class CartTile extends StatefulWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;
  const CartTile(
      {super.key, required this.productDataModel, required this.cartBloc});

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Image.network(
                widget.productDataModel.imageUrl,
                // height: 100,
                // width: 100,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.productDataModel.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.productDataModel.description,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Price: ${widget.productDataModel.price}',
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // widget.cartBloc.add(CartButtonClickedEvent());
                    },
                    child: const Text('Add to Wishlist'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // widget.homeBloc.add(HomeCartButtonClickedEvent(product: widget.productDataModel));
                    },
                    child: const Text('Add to Cart'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
