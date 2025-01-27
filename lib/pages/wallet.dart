import 'package:flutter/material.dart';
import 'package:mordidinha/widget/widget-support-text.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 60),
        child: Column(
          children: [
            Material(
              elevation: 2,
              child: Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Center(
                    child: Text(
                  "Carteira",
                  style: AppWidget.mdBoldTextStyle(),
                )),
              ),
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.pink[50]),
              child: Row(children: [
                Image.asset(
                  'assets/images/wallet.jpg',
                  height: 70,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sua carteira',
                      style: AppWidget.smLightTextStyle(),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "R" + "\$" + " 100,00",
                      style: AppWidget.lgboldTextStyle(),
                    )
                  ],
                )
              ]),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Adicionar dinheiro",
                style: AppWidget.mdBoldTextStyle(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFD9D9D9), width: 1.5),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "R" + "\$" + " 100,00",
                    style: AppWidget.smBoldTextStyle(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFD9D9D9), width: 1.5),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "R" + "\$" + " 500,00",
                    style: AppWidget.smBoldTextStyle(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFD9D9D9), width: 1.5),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "R" + "\$" + " 1000,00",
                    style: AppWidget.smBoldTextStyle(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFD9D9D9), width: 1.5),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "R" + "\$" + " 2000,00",
                    style: AppWidget.smBoldTextStyle(),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 12),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.pink[400],
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Text(
                  "Adicionar dinheiro",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20, // Corrigido para Colors.white
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
