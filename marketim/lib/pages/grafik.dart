import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class grafik extends StatefulWidget {
  const grafik({Key? key}) : super(key: key);

  @override
  State<grafik> createState() => _grafikState();
}

class _grafikState extends State<grafik> {
  @override
  Widget build(BuildContext context) {
    var data = [
      Sales("Mart", 50),
      Sales("Nisan", 70),
      Sales("Mayıs", 110),
      Sales("Haziran", 20),
    ];

    var series = [
      charts.Series(
          domainFn: (Sales sales, _) => sales.day,
          measureFn: (Sales sales, _) => sales.sold,
          id: "Sales",
          data: data,
          labelAccessorFn: (Sales sales, _) =>
              "${sales.day} : ${sales.sold.toString()}")
    ];

    var chart = charts.BarChart(
      series,
      vertical: false,
      barRendererDecorator: charts.BarLabelDecorator<String>(),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text("Alışveriş Grafiği"),
            SizedBox(height: 400, child: chart),
          ],
        ),
      ),
    );
  }
}

class Sales {
  final String day;
  final int sold;

  Sales(this.day, this.sold);
}
