import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce_app/models/cart.dart';
import 'package:e_commerce_app/models/shoe.dart';
import 'package:e_commerce_app/components/shoe_tile.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // add shoe to cart
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    // alert te user, shoe successfully added
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text('Successfully added'),
              content: Text("Check your cart"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => (Column(children: [
              Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(15)),
                  child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Search", style: TextStyle(color: Colors.grey)),
                        Icon(Icons.search, color: Colors.grey)
                      ])),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  child: Text("Everyone flies.....some fly longer than others",
                      style: TextStyle(color: Colors.grey[600]))),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Hot Picks ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24)),
                        Text("See all",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue))
                      ])),
              const SizedBox(height: 10),

              // list of shoes for sale
              Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        // create a shoe
                        Shoe shoe = value.getShoeList()[index];
                        // Shoe(
                        //     name: 'Air Jordan',
                        //     price: '240',
                        //     description: 'Cool Shoe',
                        //     imagePath: 'lib/images/AirJordanOne.jpg');

                        // return the shoe
                        return ShoeTile(
                          shoe: shoe,
                          onTap: () => addShoeToCart(shoe),
                        );
                      })),
              const Padding(
                padding: EdgeInsets.only(top: 25, right: 25, left: 25),
                child: Divider(
                  color: Colors.white,
                ),
              )
            ])));
  }
}
