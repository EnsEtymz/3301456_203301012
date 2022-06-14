import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:marketim/api/apiurunu.dart';
import 'package:marketim/model/user_model.dart';
import 'package:marketim/pages/anakategori.dart';
import 'package:marketim/pages/search.dart';
import 'package:marketim/pages/sepet.dart';
import 'package:marketim/pages/uruninceleme.dart';
import 'package:marketim/pages/user_page.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();

    FirebaseFirestore.instance
        .collection("users")
        .doc(user?.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text("Merhaba ${loggedInUser.firstname}"),
        backgroundColor: Colors.redAccent,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: ListView(
                children: [
                  buildbaslik("Anasayfa"),
                  buildbanner(context),

                  //İndirim
                  Padding(
                    padding: const EdgeInsets.only(top: 48),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "İndirimli Ürünler",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      indirim("Domates", "assets/images/domates.jpg", "%30",
                          context),
                      indirim("Elma", "assets/images/elma.jpg", "-40%", context)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      indirim(
                          "Boron", "assets/images/boron.jpg", "%30", context),
                      indirim("Pril Deterjan", "assets/images/pril.jpg", "-40%",
                          context)
                    ],
                  ),

                  const SizedBox(height: 15),
                  ActionChip(
                      label: const Text("LogOut"),
                      onPressed: () {
                        logout(context);
                      }),
                  const SizedBox(height: 100),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.red,
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
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const userspage()));
  }
}

buildbaslik(String baslik) {
  return Padding(
    padding: const EdgeInsets.only(top: 30.0),
    child: Text(
      baslik,
      style: const TextStyle(
          fontSize: 32, color: Color(0xFF0A1034), fontWeight: FontWeight.bold),
    ),
  );
}

buildbanner(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const apiurun();
      }));
    },
    child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Container(
          padding: const EdgeInsets.all(25.0),
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 49, 58, 88)),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Laptop Çantası \n İndirimde !!!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "109 TL",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              const SizedBox(
                width: 25,
              ),
              Image.asset("assets/images/çanta.jpg")
            ],
          ),
        )),
  );
}

Widget indirim(
    String text, String photourl, String indmiktari, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return urunincele(text, photourl);
      }));
    },
    child: Container(
      padding: const EdgeInsets.only(left: 12, top: 12, bottom: 21),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4), color: Colors.white),
            child: Text(
              indmiktari,
              style: const TextStyle(color: Colors.blue, fontSize: 12),
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          Image.asset(photourl),
          const SizedBox(
            height: 22,
          ),
          Text(
            text,
            style: const TextStyle(color: Colors.black, fontSize: 18),
          )
        ],
      ),
    ),
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
