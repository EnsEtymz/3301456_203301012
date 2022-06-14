// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:marketim/api/apiurunu.dart';
import 'package:marketim/model/user_model.dart';
import 'package:marketim/pages/anakategori.dart';
import 'package:marketim/pages/grafik.dart';
import 'package:marketim/pages/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:marketim/pages/search.dart';
import 'package:marketim/pages/sepet.dart';

class userspage extends StatefulWidget {
  const userspage({Key? key}) : super(key: key);

  @override
  State<userspage> createState() => _userspageState();
}

class _userspageState extends State<userspage> with TickerProviderStateMixin {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //Firebase kodları
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Lütfen emailinizi girin");
          }
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.mail),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "email",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )));
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: true,
        validator: (value) {
          RegExp regex = RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Lütfen şifrenizi girin");
          }
          if (!regex.hasMatch(value)) {
            return ("Lütfen doğru şifreyi girin(min 6 karakter)");
          }
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.vpn_key),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "şifre",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )));

    final loginbutton = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: Colors.redAccent,
        child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            signIn(emailController.text, passwordController.text);
          },
          child: const Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ));
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: AnimatedSize(
          duration: const Duration(seconds: 1),
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(
                          height: 120,
                        ),
                        const SizedBox(
                          height: 45,
                        ),
                        emailField,
                        const SizedBox(
                          height: 25,
                        ),
                        passwordField,
                        const SizedBox(
                          height: 35,
                        ),
                        loginbutton,
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text("Dont have a account"),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const kayitol()));
                              },
                              child: const Text(
                                "Kaydol",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 15),
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
              ),
            ),
          ),
        ),
      ),
    ));
  }

  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Başarılı"),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: ((context) => const HomePage())))
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}

class kayitol extends StatefulWidget {
  const kayitol({Key? key}) : super(key: key);

  @override
  State<kayitol> createState() => _kayitolState();
}

class _kayitolState extends State<kayitol> {
  final _auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();

  final TextEditingController firstnameEditingController =
      TextEditingController();
  final TextEditingController secondnameEditingController =
      TextEditingController();
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();
  final TextEditingController confirmpasswordEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final firstnameField = TextFormField(
        autofocus: false,
        controller: firstnameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("İsim Boş Olamaz.");
          }
          if (!regex.hasMatch(value)) {
            return ("İsim(min 3 karakter)");
          }
          return null;
        },
        onSaved: (value) {
          firstnameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.account_circle),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "First Name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )));

    final secondnameField = TextFormField(
        autofocus: false,
        controller: secondnameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Soyisim Boş Olamaz.");
          }

          return null;
        },
        onSaved: (value) {
          secondnameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.account_circle),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Second Name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )));

    final emailField = TextFormField(
        autofocus: false,
        controller: emailEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Lütfen emailinizi girin");
          }
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          emailEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.mail),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "email",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )));

    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordEditingController,
        obscureText: true,
        validator: (value) {
          RegExp regex = RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Lütfen şifrenizi girin");
          }
          if (!regex.hasMatch(value)) {
            return ("Lütfen doğru şifreyi girin(min 6 karakter)");
          }
        },
        onSaved: (value) {
          passwordEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.vpn_key),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )));

    final sign_up_button = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: Colors.redAccent,
        child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            SignUp(emailEditingController.text, passwordEditingController.text);
          },
          child: const Text(
            "Sign up",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ));

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: AnimatedSize(
          duration: const Duration(seconds: 1),
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(
                          height: 100,
                        ),
                        const SizedBox(
                          height: 45,
                        ),
                        firstnameField,
                        const SizedBox(
                          height: 20,
                        ),
                        secondnameField,
                        const SizedBox(
                          height: 20,
                        ),
                        emailField,
                        const SizedBox(
                          height: 20,
                        ),
                        passwordField,
                        const SizedBox(
                          height: 20,
                        ),
                        //confirmpasswordField,
                        const SizedBox(
                          height: 20,
                        ),
                        sign_up_button,
                        const SizedBox(height: 15)
                      ],
                    )),
              ),
            ),
          ),
        ),
      ),
    ));
  }

  void SignUp(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstname = firstnameEditingController.text;
    userModel.secondname = secondnameEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Hesap Oluşturma başarılı");
    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => const HomePage()),
        (route) => false);
  }
}

class girisveyakayit extends StatefulWidget {
  const girisveyakayit({Key? key}) : super(key: key);

  @override
  State<girisveyakayit> createState() => _girisveyakayitState();
}

class _girisveyakayitState extends State<girisveyakayit> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 20),
                SizedBox(
                  height: 80,
                  width: 300,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const userspage();
                        }));
                      },
                      style:
                          ElevatedButton.styleFrom(primary: Colors.redAccent),
                      child: const Text("Giriş Yap")),
                ),
                SizedBox(
                  height: 80,
                  width: 300,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const kayitol();
                        }));
                      },
                      style:
                          ElevatedButton.styleFrom(primary: Colors.redAccent),
                      child: const Text("Kayıt Ol")),
                ),
                SizedBox(
                  height: 80,
                  width: 300,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const grafik();
                        }));
                      },
                      style:
                          ElevatedButton.styleFrom(primary: Colors.redAccent),
                      child: const Text("Alışveriş Grafiğim")),
                ),
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
                        navicon(Icons.shopping_basket, false, const sepet(),
                            context),
                        navicon(Icons.person, false, const girisveyakayit(),
                            context),
                      ],
                    ),
                  ),
                )
              ]),
        ),
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
