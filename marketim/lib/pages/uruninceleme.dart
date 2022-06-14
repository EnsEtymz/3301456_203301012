import 'package:flutter/material.dart';
import 'package:marketim/pages/homepage.dart';

class urunincele extends StatefulWidget {
  late String urunno;
  late String photo;

  urunincele(this.urunno, this.photo, {Key? key}) : super(key: key);

  @override
  State<urunincele> createState() => _uruninceleState();
}

class _uruninceleState extends State<urunincele> {
  List<int> miktarlar = [1, 2, 3];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
        ),
        body: SafeArea(
            child: Stack(children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(height: 29),
                  buildbaslik(widget.urunno),
                  const SizedBox(height: 25),
                  Image.asset(widget.photo),
                  const SizedBox(height: 30),
                  const Text(
                    "Miktar",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      miktarsecenekleri(1, false),
                      miktarsecenekleri(2, false),
                      miktarsecenekleri(3, false)
                    ],
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: 300,
                    height: 80,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.redAccent)),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: const Text("Tamam"),
                                    content: const Text("Sepete Eklendi!"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Kapat"))
                                    ],
                                  ));
                        },
                        child: const Text("Sepete Ekle")),
                  )
                ],
              ))
        ])));
  }
}

Widget miktarsecenekleri(
  int miktar,
  bool selected,
) {
  return GestureDetector(
    onTap: () {
      selected = true;
    },
    child: Row(
      children: [
        Text(
          "$miktar Kg     ",
          style: TextStyle(fontSize: 16, color: Colors.redAccent),
        ),
      ],
    ),
  );
}
