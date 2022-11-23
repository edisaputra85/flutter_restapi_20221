import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Detail extends StatefulWidget {
  const Detail({super.key, required arguments});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  TextEditingController textControllerKodeBarang = TextEditingController();
  TextEditingController textControllerNamaBarang = TextEditingController();
  TextEditingController textControllerHargaBarang = TextEditingController();
  TextEditingController textControllerStokBarang = TextEditingController();
  @override
  Widget build(BuildContext context) {
    dynamic dataBarang = ModalRoute.of(context)!.settings.arguments;
    textControllerKodeBarang.text = dataBarang['item_code'].toString();
    textControllerNamaBarang.text = dataBarang['item_name'].toString();
    textControllerHargaBarang.text = dataBarang['price'].toString();
    textControllerStokBarang.text = dataBarang['stock'].toString();
    return Scaffold(
        appBar: AppBar(title: Text("Halaman Detail")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
                child: TextFormField(
                    controller: textControllerKodeBarang,
                    decoration: InputDecoration(
                      hintText: 'Kode Barang',
                      labelText: 'Kode Barang',
                      icon: Icon(Icons.numbers),
                    ))),
            Container(
                margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
                child: TextFormField(
                    controller: textControllerNamaBarang,
                    decoration: InputDecoration(
                      hintText: 'Nama Barang',
                      labelText: 'Nama Barang',
                      icon: Icon(Icons.perm_identity),
                    ))),
            Container(
                margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
                child: TextFormField(
                    controller: textControllerHargaBarang,
                    decoration: InputDecoration(
                      hintText: 'Harga Barang',
                      labelText: 'Harga Barang',
                      icon: Icon(Icons.perm_identity),
                    ))),
            Container(
                margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
                child: TextFormField(
                    controller: textControllerStokBarang,
                    decoration: InputDecoration(
                      hintText: 'Stok Barang',
                      labelText: 'Stok Barang',
                      icon: Icon(Icons.perm_identity),
                    ))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
                      child: ElevatedButton(
                        child: Text("Ubah Data"),
                        onPressed: () {},
                      )),
                  Container(
                      margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
                      child: ElevatedButton(
                        child: Text("Hapus Data"),
                        onPressed: () {
                          hapusData(dataBarang['item_code'].toString());
                        },
                      )),
                ],
              ),
            ),
          ],

          //Text(dataBarang['item_name'] + " harga:" + dataBarang['price']),
        ));
  }

  void hapusData(String kodeBarang) async {
    //final response =
    //    await http.get(Uri.parse("http://10.0.2.2/my_store/delete.php"));
  }
}
