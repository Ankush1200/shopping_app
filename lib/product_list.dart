import 'package:flutter/material.dart';
import 'package:shoping_app/Product_details.dart';
import 'package:shoping_app/global_variable.dart';
import 'package:shoping_app/products_cart.dart';
class ProductList extends StatefulWidget {
  const ProductList({super.key});
  
  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
    final List<String> filter = const ['All', 'Adidaas', 'Nike', 'Bata'];
    late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filter[0];
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromARGB(255, 143, 143, 143),
        ),
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(50),
        ));
    return SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Shoes\nCollection',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      prefixIconColor: Color.fromARGB(255, 123, 123, 122),
                      hintText: 'Search Items',
                      filled: true,
                      fillColor: Color.fromARGB(255, 229, 228, 228),
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filter.length,
                  itemBuilder: (context, index) {
                    final filters = filter[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedFilter = filters;
                          });
                        },
                        child: Chip(
                          backgroundColor: selectedFilter == filters
                              ? Theme.of(context).colorScheme.primary
                              : const Color.fromARGB(255, 255, 255, 255),
                          label: Text(filters),
                          labelStyle: const TextStyle(
                            fontSize:15,
                            fontWeight: FontWeight.bold,
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 12),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ProdeucDetailsPage(product: product);
                          },
                        ),
                      );
                    },
                    child: ProductCart(
                      title: product['title'] as String,
                      price: product['price'] as double,
                      image: product['imageUrl'] as String,
                      backgroundColor: index.isEven
                          ? const Color.fromARGB(255, 197, 207, 216)
                          : const Color.fromRGBO(216, 240, 253, 1),
                    ),
                  );
                },
              ),
            )
          ],
        ),
       );
  }
}