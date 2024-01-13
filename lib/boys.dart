import 'package:flutter/material.dart';

class BoysPage extends StatefulWidget {
  const BoysPage({super.key});

  @override
  State<BoysPage> createState() => _BoysPageState();
}

class _BoysPageState extends State<BoysPage> {
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
      body: Text("boys page"),
    );
  }
}
