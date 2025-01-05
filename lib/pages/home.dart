import 'package:flutter/material.dart';
import 'package:mordidinha/pages/details.dart';
import 'package:mordidinha/widget/widget-support-text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool tea = false, muffin = false, rolls = false, lolipop = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Olá, Karol",
                  style: AppWidget.lgboldTextStyle(),
                ),
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Icon(Icons.shopping_cart, color: Colors.white),
                )
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Mordidinha!",
              style: AppWidget.mdBoldTextStyle(),
            ),
            Text("Entregando sabores, mordida por mordida!",
                style: AppWidget.mdLightTextStyle()),
            SizedBox(height: 20),
            showItem(),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Details()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(8),
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/pizza.jpg',
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              Text("Doce queijinho",
                                  style: AppWidget.mdBoldTextStyle()),
                              SizedBox(height: 5),
                              Text(
                                'Muito queijo, muito amor.',
                                style: AppWidget.smLightTextStyle(),
                              ),
                              SizedBox(height: 2),
                              Text('R\$ 25,00',
                                  style: AppWidget.smBoldTextStyle())
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    margin: EdgeInsets.all(8),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/pizza.jpg',
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            Text("Doce queijinho",
                                style: AppWidget.mdBoldTextStyle()),
                            SizedBox(height: 5),
                            Text(
                              'Muito queijo, muito amor.',
                              style: AppWidget.smLightTextStyle(),
                            ),
                            SizedBox(height: 2),
                            Text('R\$ 25,00',
                                style: AppWidget.smBoldTextStyle())
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/pizza.jpg',
                              width: 120,
                              height: 120,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    "AAAAAAAAAAAA",
                                    style: AppWidget.smBoldTextStyle(),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    "bbbbbbb",
                                    style: AppWidget.smLightTextStyle(),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    "R\$ 28,00",
                                    style: AppWidget.smBoldTextStyle(),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(right: 20),
                  //   child: Material(
                  //     elevation: 5,
                  //     borderRadius: BorderRadius.circular(20),
                  //     child: Container(
                  //       padding: EdgeInsets.all(5),
                  //       child: Row(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Image.asset(
                  //             'assets/images/pizza.jpg',
                  //             width: 120,
                  //             height: 120,
                  //           ),
                  //           SizedBox(
                  //             height: 20,
                  //           ),
                  //           Column(
                  //             children: [
                  //               Container(
                  //                 width: MediaQuery.of(context).size.width / 2,
                  //                 child: Text(
                  //                   "AAAAAAAAAAAA",
                  //                   style: AppWidget.smBoldTextStyle(),
                  //                 ),
                  //               ),
                  //               SizedBox(height: 5),
                  //               Container(
                  //                 width: MediaQuery.of(context).size.width / 2,
                  //                 child: Text(
                  //                   "bbbbbbb",
                  //                   style: AppWidget.smLightTextStyle(),
                  //                 ),
                  //               ),
                  //               SizedBox(height: 5),
                  //               Container(
                  //                 width: MediaQuery.of(context).size.width / 2,
                  //                 child: Text(
                  //                   "R\$ 28,00",
                  //                   style: AppWidget.smBoldTextStyle(),
                  //                 ),
                  //               )
                  //             ],
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget showItem() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      GestureDetector(
        onTap: () {
          tea = true;
          muffin = false;
          rolls = false;
          lolipop = false;
          setState(() {});
        },
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  width: 3.0,
                  color: tea
                      ? const Color.fromARGB(255, 240, 152, 181)
                      : Colors.white,
                ),
                borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.all(10),
            child: Image.asset(
              'assets/images/pizza-icon.jpg',
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          tea = false;
          muffin = true;
          rolls = false;
          lolipop = false;
          setState(() {});
        },
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  width: 3.0,
                  color: muffin
                      ? const Color.fromARGB(255, 240, 152, 181)
                      : Colors.white,
                ),
                borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.all(10),
            child: Image.asset(
              'assets/images/muffin.jpg',
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          tea = false;
          muffin = false;
          rolls = true;
          lolipop = false;
          setState(() {});
        },
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  width: 3.0,
                  color: rolls
                      ? const Color.fromARGB(255, 240, 152, 181)
                      : Colors.white,
                ),
                borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.all(10),
            child: Image.asset(
              'assets/images/rolls.jpg',
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          tea = false;
          muffin = false;
          rolls = false;
          lolipop = true;
          setState(() {});
        },
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  width: 3.0,
                  color: lolipop
                      ? const Color.fromARGB(255, 240, 152, 181)
                      : Colors.white,
                ),
                borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.all(10),
            child: Image.asset(
              'assets/images/lolipop.jpg',
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    ]);
  }
}
