import 'package:flutter/material.dart';
import 'package:marketim/pages/homepage.dart';
import 'package:marketim/pages/uruninceleme.dart';

class tekkategori extends StatelessWidget {
  late String kategoriismi;

  tekkategori(this.kategoriismi);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: ListView(
                  children: [
                    buildbaslik(kategoriismi),
                    const Padding(
                      padding: EdgeInsets.only(top: 48),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        urunler("Elma", "assets/images/elma.jpg", "10 TL/kg",
                            context),
                        urunler("Çilek", "assets/images/çilek.jpg", "10 TL/kg",
                            context)
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        urunler("Karpuz", "assets/images/karpuz.jpg", "9 TL/kg",
                            context),
                        urunler(
                            "Muz", "assets/images/muz.jpg", "11 TL/kg", context)
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        urunler("Yenidünya", "assets/images/yenidünya.jpg",
                            "9 TL/kg", context),
                        urunler("Kiraz", "assets/images/kiraz.jpg", "11 TL/kg",
                            context)
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

urunler(String text, String asset, String fiyat, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return urunincele(text, asset);
      }));
    },
    child: Column(
      children: [
        Image.asset(
          asset,
        ),
        Column(
          children: [
            Text(text),
            Text(
              fiyat,
              style: const TextStyle(color: Colors.black),
            )
          ],
        )
      ],
    ),
  );
}
