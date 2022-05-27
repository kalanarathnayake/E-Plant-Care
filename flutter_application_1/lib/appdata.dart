import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class appdata extends StatefulWidget {
  const appdata({Key? key}) : super(key: key);

  @override
  State<appdata> createState() => _appdataState();
}

String l = '70';
String s = '32';
String t = '250';
String h = '30';

class _appdataState extends State<appdata> {
  DatabaseReference humidityref =
      FirebaseDatabase.instance.ref().child('DHT11/Humidity');

  DatabaseReference temperatureref =
      FirebaseDatabase.instance.ref().child('DHT11/Temperature');

  DatabaseReference lightref =
      FirebaseDatabase.instance.ref().child('GY30/LightIntence');

  DatabaseReference soilmoistref = FirebaseDatabase.instance
      .ref()
      .child('CapacitiveSoilMoist1_2v/soilMoist');

  //get data
  getData() {
    humidityref.onValue.listen((event) {
      setState(() {
        h = event.snapshot.value.toString();
      });
    });
    temperatureref.onValue.listen((event) {
      setState(() {
        t = event.snapshot.value.toString();
      });
    });
    lightref.onValue.listen((event) {
      setState(() {
        l = event.snapshot.value.toString();
      });
    });
    soilmoistref.onValue.listen((event) {
      setState(() {
        s = event.snapshot.value.toString();
      });
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [Text(l), Text(s), Text(t), Text(h)],
      ),
    );
  }
}
