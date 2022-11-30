import 'package:flutter/material.dart';
import 'package:flutter_crud_mysql/main.dart';

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
        children: [
          Text(dataBarang['item_name'] + " harga:" + dataBarang['price']),
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
                child: Text("Ubah Data"),
                onPressed: () {
                  dataBarang['item_code'] = textControllerKodeBarang.text;
                  dataBarang['item_name'] = textControllerNamaBarang.text;
                  dataBarang['price'] = textControllerHargaBarang.text;
                  dataBarang['stock'] = textControllerStokBarang.text;
                  editData(dataBarang);
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return Home();
                  }), (r) {
                    return false;
                  });
                },
              ),
              ElevatedButton(
                child: Text("Hapus Data"),
                onPressed: () {
                  hapusData(dataBarang['item_code'].toString());
                  //Navigator.pushNamed(context, '/main');
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

  void hapusData(String item_code) async {
    String sql = "http://10.0.2.2/my_store/delete.php?item_code=$item_code";
    await http.get(Uri.parse(sql));
  }

  void editData(dynamic dataBarang) async {
    String item_code = dataBarang['item_code'];
    String item_name = dataBarang['item_name'];
    String price = dataBarang['price'].toString();
    String stock = dataBarang['stock'].toString();
    String sql =
        "http://10.0.2.2/my_store/edit.php?item_code=$item_code&item_name=$item_name&price=$price&stock=$stock";
    await http.get(Uri.parse(sql));
  }
}
