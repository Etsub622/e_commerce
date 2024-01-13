import 'package:flutter/material.dart';
import 'package:e_commerce/global_variables.dart';
import 'package:e_commerce/product_cart.dart';
import 'package:e_commerce/product_details_screen.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const ['All', 'Boys', 'Girls', 'Childrens'];
  late String selectedFilter;
  

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text('Midi\nShopping',
                      style: Theme.of(context).textTheme.titleLarge),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'search',
                        prefixIcon: Icon(
                          Icons.search_outlined,
                          size: 22,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(225, 225, 255, 1)),
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 150,
                child: ListView.builder(
                    itemCount: filters.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final filter = filters[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedFilter = filter;
                              });
                            },
                            child: Chip(
                              backgroundColor: selectedFilter == filter
                                  ? Theme.of(context).colorScheme.primary
                                  : const Color.fromARGB(255, 243, 242, 240),
                              side: const BorderSide(
                                  color: Color.fromARGB(26, 226, 222, 222)),
                              label: Text(
                                filter,
                                style: const TextStyle(fontSize: 15.0),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return ProdudctDetails(product: product);
                          }));
                        },
                        child: ProductCart(
                          title: product['title'] as String,
                          price: product['price'] as int,
                          image: product['imageUrl'] as String,
                          bgcolor: index.isEven
                              ? Color.fromARGB(255, 214, 246, 246)
                              : Color.fromARGB(255, 240, 243, 243),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),

    );
  }
}