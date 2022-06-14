import 'package:flutter/material.dart';

import 'package:marketim/pages/anakategori.dart';
import 'package:marketim/pages/homepage.dart';
import 'package:marketim/pages/search.dart';
import 'package:marketim/pages/user_page.dart';

class sepet extends StatelessWidget {
  const sepet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Sepet Boş !!"),
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
