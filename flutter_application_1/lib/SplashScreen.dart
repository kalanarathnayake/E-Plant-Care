import 'package:flutter/material.dart';
import 'package:flutter_application_1/appdata.dart';

class splashScreen extends StatefulWidget {
  splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

int? logged;

class _splashScreenState extends State<splashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  void initState() {
    getdata();
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.addListener(() {
      print(_controller.value);
      //  if the full duration of the animation is 8 secs then 0.5 is 4 secs
      if (_controller.value > 1) {
// When it gets there hold it there.
        _controller.value = 1;
      }
    });
    //set time to load the new page

    super.initState();
  }

  getdata() async {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => appdata()), (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                  "assets/images/closeup-wild-fern-leaves-with-dew-them-forest.jpg"),
              fit: BoxFit.cover,
            )),
          ),
          Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(color: Colors.black54)),
          Center(
            child: SizedBox(
              height: 140,
              child: Image.asset(
                "assets/images/Logo.png",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
