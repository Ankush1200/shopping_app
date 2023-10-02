import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/cart_provider.dart';
// import 'package:shoping_app/global_variable.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart=Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Cart')),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartitem = cart[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(
                cartitem['imageUrl'] as String,
              ),
            ),
            title: Text(
              cartitem['title'].toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text(
              'Size,${cartitem['size']}',
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete,color: Colors.red,),
            ),
          );
        },
      ),
    );
  }
}
