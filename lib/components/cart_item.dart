import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_store/models/cart.dart';

import '../models/shoe.dart';

class CartItem extends StatefulWidget {
  Shoe shoe;
  CartItem({super.key, required this.shoe});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {

  // Remove item from cart
  void removeItemFromCart() {
    Provider.of<Cart  >(context, listen: false).removeItemFromCart(widget.shoe);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(widget.shoe.imageUrl),
        title: Text(widget.shoe.name, style: Theme.of(context).textTheme.titleMedium,),
        subtitle: Text('\$${widget.shoe.price}'),
        trailing: IconButton(
          onPressed: () => removeItemFromCart(),
          icon: Icon(Icons.delete, color: Colors.grey.shade900,),
        ),
      ),
    );
  }
}
