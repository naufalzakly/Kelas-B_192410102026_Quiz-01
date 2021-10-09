import 'package:flutter/material.dart';
import 'package:keranjang_belanja/main_screen.dart';

class DetailBarang extends StatefulWidget {
  const DetailBarang({Key? key}) : super(key: key);

  @override
  _DetailBarangState createState() => _DetailBarangState();
}

class _DetailBarangState extends State<DetailBarang> {
  int id = 0;
  dynamic data;
  int barangCounter = -1;

  void initCounter() {
    barangCounter = data['jumlah'];
  }


  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments;
    id = data['index'];
    if (barangCounter < 0) {
      initCounter();
    }
    // barangCounter = data['jumlah'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        title: Text(
          "Detail Barang",
          style: TextStyle(fontSize: 23),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                  'img/${data["gambar"]}',
                  height: 200,
                  width: 550,
                ),
              SizedBox(
                height: 25,
              ),
              Text(
                data['namaBarang'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Harga Per satuan Rp. ${data["harga"]}",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Deskripsi blabla",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 45,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (!(barangCounter <= 0)) {
                          barangCounter--;
                        }
                      });
                    },
                    child: Text(
                      "-",
                      style: TextStyle(fontSize: 35),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue[600]),
                    ),
                  ),
                  Text(
                    "Jumlah barang = $barangCounter",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        barangCounter++;
                      });
                    },
                    child: Text(
                      "+",
                      style: TextStyle(fontSize: 35),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue[600]),
                    ),
                  ),
                  SizedBox(),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/', arguments: {
                    'index' : id,
                    'jumlah' : barangCounter,
                  });
                },
                child: Text(
                  "Konfirmasi",
                  style: TextStyle(fontSize:20),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue[600]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}