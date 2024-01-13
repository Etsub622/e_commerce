import 'package:flutter/material.dart';

class GirlsPage extends StatefulWidget {
  const GirlsPage({super.key});

  @override
  State<GirlsPage> createState() => _GirlsPageState();
}

class _GirlsPageState extends State<GirlsPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Details',
          style: Theme.of(context).textTheme.titleMedium,
        )),
      ),
      body: Text("girls page"),
    );
  }
}
