import 'package:flutter/material.dart';
import 'package:mordidinha/pages/login.dart';
import 'package:mordidinha/widget/content_model.dart';
import 'package:mordidinha/widget/widget-support-text.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
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
                      padding: EdgeInsets.all(20),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Image.asset(
                                contents[i].image,
                                height: 450,
                                width: double.infinity,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(
                              height: 70,
                            ),
                            Text(
                              contents[i].title,
                              style: AppWidget.mdBoldTextStyle(),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              contents[i].description,
                              style: AppWidget.smLightTextStyle(),
                              textAlign: TextAlign.center,
                            )
                          ]));
                }),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contents.length,
                (index) => buildDot(index, context),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (currentIndex == contents.length - 1) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LogIn(),
                    ));
              }

              _controller.nextPage(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.bounceIn);
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.pink, borderRadius: BorderRadius.circular(24)),
              height: 60,
              margin: EdgeInsets.all(40),
              width: double.infinity,
              child: Text(
                currentIndex == contents.length - 1 ? 'Começar!' : 'Próximo',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 18 : 7,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: currentIndex == index
              ? Colors.pink
              : const Color.fromARGB(255, 255, 159, 191),
          borderRadius: BorderRadius.circular(6)),
    );
  }
}
