import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  const Detail({super.key, required arguments});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    dynamic dataBarang = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text("Halaman Detail")),
      body: Text(dataBarang['item_name'] + " harga:" + dataBarang['price']),
    );
  }
}
