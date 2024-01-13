import 'package:e_commerce/cart_Provider.dart';
import 'package:e_commerce/global_variables.dart';
import 'package:e_commerce/home_screen.dart';
import 'package:e_commerce/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context)=>CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Edu',
          colorScheme: ColorScheme.fromSeed(
            seedColor:const Color.fromARGB(255, 175, 243, 247),
            primary:const Color.fromARGB(255, 65, 186, 192),),
          textTheme:const TextTheme(
              titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
              titleMedium: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
              bodySmall: TextStyle(fontWeight: FontWeight.w400,fontSize: 16),),
          appBarTheme:const  AppBarTheme(
              titleTextStyle:TextStyle(fontSize:25 ,color: Colors.black) ,
              backgroundColor: Colors.white) ,
          inputDecorationTheme:const InputDecorationTheme(
            hintStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
            prefixIconColor: Color.fromRGBO(177, 176, 176, 1)
          ),    
              useMaterial3: true,
          ),   
        // home:ProdudctDetails(product:products[0])
        home:const HomeScreen()  
      ),
    );
  }
}
