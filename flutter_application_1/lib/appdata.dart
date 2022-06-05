import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class appdata extends StatefulWidget {
  const appdata({Key? key}) : super(key: key);

  @override
  State<appdata> createState() => _appdataState();
}

double l = 70;
double s = 32;
double t = 250;
double h = 30;
double humiditylow = 75.00;
double humidityhigh = 80.00;

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
        h = double.parse(event.snapshot.value.toString());
      });
    });
    temperatureref.onValue.listen((event) {
      setState(() {
        t = double.parse(event.snapshot.value.toString());
      });
    });
    lightref.onValue.listen((event) {
      setState(() {
        l = double.parse(event.snapshot.value.toString());
      });
    });
    soilmoistref.onValue.listen((event) {
      setState(() {
        s = double.parse(event.snapshot.value.toString());
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
      backgroundColor: Color.fromARGB(255, 34, 34, 34),
      appBar: AppBar(
        title: Text('E Plant Care'),
        backgroundColor: Color.fromARGB(255, 25, 109, 0),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: h >= 75.0 && h <= 90.0 ? Colors.green : Colors.red,
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Humidity ',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white70,
                              fontFamily: 'poppins',
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                h.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontFamily: 'poppins',
                                ),
                              ),
                              const Text(
                                "%",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontFamily: 'poppins',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: t >= 25.0 && t <= 35.0 ? Colors.green : Colors.red,
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Temperature',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white70,
                              fontFamily: 'poppins',
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                t.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontFamily: 'poppins',
                                ),
                              ),
                              const Text(
                                "°C",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontFamily: 'poppins',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: l >= 50.0 && l <= 100.0
                        ? Colors.blue
                        : l >= 0.0 && l < 50.0
                            ? Colors.orange
                            : Colors.red,
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'light Intensity',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white70,
                              fontFamily: 'poppins',
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                l.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontFamily: 'poppins',
                                ),
                              ),
                              const Text(
                                " lux",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontFamily: 'poppins',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: s >= 75.0 && s <= 100.0 ? Colors.green : Colors.red,
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Soil Moisture',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white70,
                              fontFamily: 'poppins',
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                s.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontFamily: 'poppins',
                                ),
                              ),
                              const Text(
                                "%",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontFamily: 'poppins',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
