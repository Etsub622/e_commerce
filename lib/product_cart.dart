import 'package:flutter/material.dart';
class ProductCart extends StatelessWidget {
  final String title;
  final int price;
  final String image;
  final Color bgcolor;
  const ProductCart({super.key, required this.title, required this.price, required this.image, required this.bgcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:bgcolor,
        borderRadius: BorderRadius.circular(25.0)
      ),
      height: 300,
      
      padding:const EdgeInsets.all(20),
      margin: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
        Text(title,style: Theme.of(context).textTheme.titleMedium,),
        const SizedBox(height: 5,),
        Text('\$$price',style: Theme.of(context).textTheme.bodySmall,),
        const SizedBox(height: 5,),
        Center(child: Image.asset(image,height: 180,))
        ]),
    );
  }
}

 