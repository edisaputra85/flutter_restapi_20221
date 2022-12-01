import 'package:flutter/material.dart';
import 'package:flutter_crud_mysql/main.dart';

import 'package:http/http.dart' as http;

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  TextEditingController textControllerKodeBarang = TextEditingController();
  TextEditingController textControllerNamaBarang = TextEditingController();
  TextEditingController textControllerHargaBarang = TextEditingController();
  TextEditingController textControllerStokBarang = TextEditingController();
  dynamic dataBarang;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Halaman Tambah Data")),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              controller: textControllerKodeBarang,
              decoration: InputDecoration(
                  labelText: "Kode Barang",
                  hintText: "inputkan kode barang",
                  icon: Icon(Icons.code)),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              controller: textControllerNamaBarang,
              decoration: InputDecoration(
                  labelText: "Nama Barang",
                  hintText: "inputkan nama barang",
                  icon: Icon(Icons.person)),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              controller: textControllerHargaBarang,
              decoration: InputDecoration(
                  labelText: "Harga Barang",
                  hintText: "inputkan harga barang",
                  icon: Icon(Icons.person)),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              controller: textControllerStokBarang,
              decoration: InputDecoration(
                  labelText: "Stok Barang",
                  hintText: "inputkan stok barang",
                  icon: Icon(Icons.person)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: Text("Simpan Data"),
                onPressed: () {
                  tambahData(
                      textControllerKodeBarang.text,
                      textControllerNamaBarang.text,
                      textControllerHargaBarang.text,
                      textControllerStokBarang.text);
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return Home();
                  }), (r) {
                    return false;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void tambahData(
      String item_code, String item_name, String price, String stock) async {
    String sql =
        "http://10.0.2.2/my_store/add.php?item_code=$item_code&item_name=$item_name&price=$price&stock=$stock";
    await http.get(Uri.parse(sql));
  }
}
