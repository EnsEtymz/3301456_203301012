import 'package:flutter/material.dart';
import 'package:marketim/pages/anakategori.dart';
import 'package:marketim/pages/homepage.dart';
import 'package:marketim/pages/kayitlarsayfasi.dart';
import 'package:marketim/pages/sepet.dart';
import 'package:marketim/pages/user_page.dart';
import 'package:marketim/veritabani/kayitlar.dart';
import 'package:marketim/veritabani/kayitlarservice.dart';

class search extends StatelessWidget {
  kayitlarservice kayitlarservisi = kayitlarservice.instance;
  final textcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final my_textfield = TextFormField(
        controller: textcontroller,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8))));
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 8),
              my_textfield,
              const SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.redAccent)),
                  onPressed: () {
                    kayitlarservisi.addkayit(kayitlar(textcontroller.text));
                  },
                  icon: const Icon(Icons.search),
                  label: const Text("Ara")),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.redAccent)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return kayitlarsayfasi();
                    }));
                  },
                  child: const Text("arama kayıtları")),
              const SizedBox(height: 15),
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
            ]),
      ),
    );
  }
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
