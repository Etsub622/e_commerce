import 'package:e_commerce/cartPage.dart';
import 'package:e_commerce/cart_Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProdudctDetails extends StatefulWidget {
  final Map<String, Object> product;
  const ProdudctDetails({super.key, required this.product});

  @override
  State<ProdudctDetails> createState() => _ProdudctDetailsState();
}

class _ProdudctDetailsState extends State<ProdudctDetails> {
  int selectedSize = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Details',
          style: Theme.of(context).textTheme.titleMedium,
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              widget.product['title'] as String,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(widget.product['imageUrl'] as String),
            ),
            const Spacer(
              flex: 2,
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 221, 235, 246),
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '\$${widget.product['price']}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              (widget.product['sizes'] as List<int>).length,
                          itemBuilder: (context, index) {
                            final size =
                                (widget.product['sizes'] as List<int>)[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedSize = size;
                                  });
                                },
                                child: Chip(
                                  backgroundColor: selectedSize == size
                                      ? Theme.of(context).colorScheme.primary
                                      : const Color.fromARGB(
                                          255, 243, 242, 240),
                                  label: Text(size.toString()),
                                ),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (selectedSize != 0) {
                            Provider.of<CartProvider>(context, listen: false)
                                .addProduct({
                              'id': widget.product['id'],
                              'title': widget.product['title'],
                              'price': widget.product['price'],
                              'size': selectedSize,
                              'imageUrl': widget.product['imageUrl'],
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('product added successfuly!')));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'please select size before continuing!')));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            minimumSize: const Size(double.infinity, 35)),
                        child: const Text(
                          'Add to Cart',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
