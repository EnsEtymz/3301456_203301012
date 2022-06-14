import 'package:flutter/material.dart';
import 'package:marketim/pages/homepage.dart';
import 'package:marketim/pages/uruninceleme.dart';

class sebza extends StatelessWidget {
  late String kategoriismi;

  sebza(this.kategoriismi);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(backgroundColor: Colors.redAccent),
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
                        urunler("Biber", "assets/images/biber.jpg", "19 TL/kg",
                            context),
                        urunler("Domates", "assets/images/domates.jpg",
                            "14 TL/kg", context)
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        urunler("Maydanoz", "assets/images/maydanoz.jpg",
                            "5 TL/kg", context),
                        urunler("Patates", "assets/images/patates.jpg",
                            "11 TL/kg", context)
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        urunler("Patlıcan", "assets/images/patlıcan.jpg",
                            "12 TL/kg", context),
                        urunler("Salatalık", "assets/images/salatalık.jpg",
                            "7 TL/kg", context)
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

class temizlik extends StatelessWidget {
  late String kategoriismi;

  temizlik(this.kategoriismi);
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
                        urunler("Yumuşatıcı", "assets/images/yumuşatıcı.jpg",
                            "109 TL", context),
                        urunler(
                            "Bulaşık Tableti",
                            "assets/images/bulaşıktableti.jpg",
                            "95 TL",
                            context)
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        urunler("Çamaşır Tozu", "assets/images/çamaşırtozu.jpg",
                            "99 TL/", context),
                        urunler("Çamaşır Suyu", "assets/images/çamaşırsuyu.jpg",
                            "78 TL", context)
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        urunler("Camsil", "assets/images/camsil.jpg", "29 TL",
                            context),
                        urunler(
                            "Pril", "assets/images/pril.jpg", "36 TL", context)
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

class mutfakihtiyaclari extends StatelessWidget {
  late String kategoriismi;

  mutfakihtiyaclari(this.kategoriismi);

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
                        urunler("Çatal", "assets/images/çatal.jpg", "4 TL",
                            context),
                        urunler(
                            "Kaşık", "assets/images/kaşık.jpg", "5 TL", context)
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        urunler("Tuzluk", "assets/images/tuzluk.jpg", "19 TL",
                            context),
                        urunler(
                            "Bez", "assets/images/bez.jpg", "19 TL", context)
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        urunler("Peçete", "assets/images/peçete.jpg", "9 TL",
                            context),
                        urunler("sünger", "assets/images/sünger.jpg", "11 TL",
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
              style: const TextStyle(color: Colors.blue),
            )
          ],
        )
      ],
    ),
  );
}
