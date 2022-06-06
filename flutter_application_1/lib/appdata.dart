import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

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
      backgroundColor: const Color.fromARGB(255, 18, 58, 0),
      appBar: AppBar(
        title: const Center(
          child: Text(
            'E Plant Care',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontFamily: 'poppins'),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 18, 58, 0),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 241, 246, 255)),
                    color: const Color.fromARGB(255, 114, 114, 114)
                        .withOpacity(0.37),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/humidity.png',
                                  color: Colors.white,
                                  scale: 5,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  'Humidity ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white70,
                                    fontFamily: 'poppins',
                                  ),
                                ),
                              ],
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
                        SizedBox(
                          height: 150,
                          width: 60,
                          child: LiquidLinearProgressIndicator(
                            value: h / 100, // Defaults to 0.5.
                            valueColor: AlwaysStoppedAnimation(
                              h >= 75.0 && h <= 90.0
                                  ? Colors.green
                                  : Colors.red,
                            ), // Defaults to the current Theme's accentColor.
                            backgroundColor: Colors
                                .white, // Defaults to the current Theme's backgroundColor.
                            borderWidth: 3.8,
                            borderColor: Colors.white,
                            borderRadius: 20,
                            direction: Axis.vertical,
                            center: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  h.toString(),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  '%',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ), // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 241, 246, 255)),
                    color: const Color.fromARGB(255, 114, 114, 114)
                        .withOpacity(0.37),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/temp.png',
                                  color: Colors.white,
                                  scale: 20,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  'Temperature',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white70,
                                    fontFamily: 'poppins',
                                  ),
                                ),
                              ],
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
                        SizedBox(
                          height: 150,
                          width: 60,
                          child: LiquidLinearProgressIndicator(
                            value: t / 100, // Defaults to 0.5.
                            valueColor: AlwaysStoppedAnimation(
                              t >= 25.0 && t <= 35.0
                                  ? Colors.green
                                  : Colors.red,
                            ), // Defaults to the current Theme's accentColor.
                            backgroundColor: Colors
                                .white, // Defaults to the current Theme's backgroundColor.
                            borderWidth: 3.8,
                            borderColor: Colors.white,
                            borderRadius: 20,
                            direction: Axis.vertical,
                            center: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  t.toString(),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  '%',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ), // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: l >= 50.0 && l <= 100.0
                        ? Colors.blue
                        : l >= 0.0 && l < 50.0
                            ? Colors.orange
                            : Colors.red,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/light.png',
                              scale: 20,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              'light Intensity',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white70,
                                fontFamily: 'poppins',
                              ),
                            ),
                          ],
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
                const SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: s >= 75.0 && s <= 100.0 ? Colors.green : Colors.red,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/soil.png',
                              scale: 20,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            const Text(
                              'Soil Moisture',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white70,
                                fontFamily: 'poppins',
                              ),
                            ),
                          ],
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
