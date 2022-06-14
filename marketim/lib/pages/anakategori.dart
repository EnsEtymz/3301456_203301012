import 'package:flutter/material.dart';
import 'package:marketim/pages/digericerikler.dart';
import 'package:marketim/pages/homepage.dart';
import 'package:marketim/pages/search.dart';
import 'package:marketim/pages/sepet.dart';
import 'package:marketim/pages/tek_kategori.dart';
import 'package:marketim/pages/user_page.dart';

class anakategori extends StatefulWidget {
  anakategori({Key? key}) : super(key: key);

  @override
  State<anakategori> createState() => _anakategoriState();
}

class _anakategoriState extends State<anakategori> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        appBar: AppBar(backgroundColor: Colors.redAccent),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Kategori",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(height: 29),
              kategoributonlari("Meyve", context, tekkategori("Meyve")),
              const SizedBox(
                height: 15,
              ),
              kategoributonlari("Sebze", context, sebza("Sebze")),
              const SizedBox(
                height: 15,
              ),
              kategoributonlari(
                  "Temizlik Ürünleri", context, temizlik("Temizlik")),
              const SizedBox(
                height: 15,
              ),
              kategoributonlari("Mutfak İhtiyaçları", context,
                  mutfakihtiyaclari("Mutfak İhtiyaçları")),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Colors.redAccent,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      navicon(Icons.home, true, const HomePage(), context),
                      navicon(Icons.menu, false, anakategori(), context),
                      navicon(Icons.search, false, search(), context),
                      navicon(
                          Icons.shopping_basket, false, const sepet(), context),
                      navicon(
                          Icons.person, false, const girisveyakayit(), context),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

Widget kategoributonlari(String text, BuildContext context, Widget widget) {
  return SizedBox(
    height: 80,
    width: 300,
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.redAccent),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return widget;
          }));
        },
        child: Text(text)),
  );
}

navicon(IconData icondata, bool active, Widget widget, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return widget;
      }));
    },
    child: Icon(icondata, size: 21, color: Colors.black),
  );
}
