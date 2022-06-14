import 'package:flutter/material.dart';
import 'package:marketim/veritabani/kayitlar.dart';
import 'package:marketim/veritabani/kayitlarservice.dart';

class kayitlarsayfasi extends StatefulWidget {
  @override
  State<kayitlarsayfasi> createState() => _kayitlarsayfasiState();
}

class _kayitlarsayfasiState extends State<kayitlarsayfasi> {
  kayitlarservice service = kayitlarservice.instance;
  List<kayitlar> kayitlarim = [];
  @override
  void initState() {
    loaddata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [getkayitlist(kayitlarim)],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getkayitlist(List<kayitlar> kayitlarim) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: kayitlarim.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(kayitlarim[index].text),
          ),
        );
      },
    );
  }

  loaddata() {
    service.getAll().then((value) {
      setState(() {
        kayitlarim = value;
      });
    });
  }
}
