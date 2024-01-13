import 'package:flutter/material.dart';

class ChildrensPage extends StatefulWidget {
  const ChildrensPage({super.key});

  @override
  State<ChildrensPage> createState() => _ChildrensPageState();
}

class _ChildrensPageState extends State<ChildrensPage> {
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
      body: Text("childrens page"));
  }
}
