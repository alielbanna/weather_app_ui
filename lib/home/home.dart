import 'package:flutter/material.dart';
import 'package:weather_app_ui/data.dart';
import 'dart:math' as math;

import 'package:weather_app_ui/widgets/rain/rain.dart';
import 'package:weather_app_ui/widgets/time/time.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Key parallaxOne = GlobalKey();

  bool showdate = true;

  @override
  Widget build(BuildContext context) {
    double resWidth = MediaQuery.of(context).size.width;
    double resHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: () {
          setState(() {
            showdate = false;
          });
          showModalBottomSheet(
              context: context,
              elevation: 0,
              barrierColor: Colors.black.withAlpha(1),
              backgroundColor: Colors.transparent,
              builder: (builder) {
                return SizedBox(
                  height: 600.0,
                  child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50.0),
                              topRight: Radius.circular(50.0))),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            SizedBox(
                              height: resHeight * 0.04,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/clock.png',
                                  width: 25,
                                ),
                                SizedBox(
                                  width: resWidth * 0.04,
                                ),
                                const Text(
                                  "Today's changes",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: resHeight * 0.04,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: const Color(0xff763bd7)
                                          .withOpacity(0.1),
                                      radius: 25,
                                      child: Image.asset(
                                        'assets/images/rainy.png',
                                        width: 25,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Text(
                                      "Rainy with\nshort storms",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: const Color(0xffff5580)
                                          .withOpacity(0.1),
                                      radius: 25,
                                      child: Image.asset(
                                        'assets/images/wind.png',
                                        width: 25,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Text(
                                      "Wind EN\n8 km/h",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: resHeight * 0.04,
                            ),
                            Expanded(
                              child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: data.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        TimeWidget(
                                          data: data[index],
                                          active: index == 1,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Divider(
                                          color: Colors.grey,
                                        ),
                                      ],
                                    );
                                  }),
                            )
                          ],
                        ),
                      )),
                );
              }).whenComplete(() {
            setState(() {
              showdate = true;
            });
          });
        },
        child: Container(
          //add ClipRRect widget for Round Corner
          color: const Color(0xff763bd7),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(24),
              topLeft: Radius.circular(24),
            ),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 13,
                  right: 13,
                  top: 13,
                  bottom: 26,
                ),
                child: ListTile(
                  leading: SizedBox(
                      height: 30.0,
                      width: 30.0,
                      child: Image.asset('assets/images/clock.png')),
                  title: const Text(
                    "Today's Changes",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  trailing: SizedBox(
                      height: 30.0,
                      width: 30.0,
                      child: Image.asset('assets/images/calendar.png')),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        height: resHeight * 1,
        color: const Color(0xff763bd7),
        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              height: showdate ? resHeight * 0.15 : resHeight * 0.125,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(50))),
              child: Padding(
                padding: EdgeInsets.only(top: resHeight * 0.06, left: 20),
                child: Row(
                  children: [
                    SizedBox(
                        height: 35.0,
                        width: 33.0,
                        child: Image.asset('assets/images/sun.png')),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'What to wear',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 70,
                      height: 120,
                      color: const Color(0xffff5580),
                      child: const Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    AnimatedContainer(
                      width: 70,
                      height: showdate ? 110 : 0,
                      color: const Color(0xfff7446f),
                      duration: const Duration(milliseconds: 400),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Sat',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text('03',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Transform.rotate(
              angle: math.pi / 4,
              child: SizedBox(
                height: resHeight * 1,
                child: ParallaxRain(
                  key: parallaxOne,
                  dropColors: const [
                    Colors.white,
                  ],
                  trail: true,
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: resHeight * 0.275,
              child: Image.asset(
                'assets/images/girl.png',
                height: resHeight * 0.5,
              ),
            ),
            Positioned(
              left: 20,
              top: resHeight * 0.175,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '19°',
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  ),
                  Text(
                    'Feels like 17°',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Icon(
                    Icons.cloudy_snowing,
                    color: Colors.white,
                    size: 40,
                  )
                ],
              ),
            ),
            Positioned(
              bottom: resHeight * 0.02,
              left: 20,
              child: const Text(
                'Palestine',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
