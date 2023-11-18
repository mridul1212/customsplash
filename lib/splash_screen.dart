import 'package:customsplash/content_list.dart';
import 'package:customsplash/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        contents[i].image,
                        height: 290,
                        width: 290,
                      ),
                      FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          contents[i].title,

                          style: TextStyle(

                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Text(
                        contents[i].discription,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      contents.length,
                      (index) => buildDot(index, context),
                    ),
                  ),
                ),
                currentIndex == contents.length - 1
                    ? ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.grey,

                            fixedSize: const Size(150, 50),
                            padding: EdgeInsets.only(left: 10, right: 5),
                            backgroundColor: Color(0xff0961F5)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Get Started",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white)),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ))
                    : Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xff0961F5)),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex==index ? Color(0xff0961F5):Colors.grey,
      ),
    );
  }
}
