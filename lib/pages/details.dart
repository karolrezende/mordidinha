import 'package:flutter/material.dart';
import 'package:mordidinha/widget/widget-support-text.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int a = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.pink,
            ),
          ),
          Image.asset('assets/images/pizza.jpg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              fit: BoxFit.fill),
          SizedBox(
            height: 15.0,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Doce Queijinho", style: AppWidget.mdBoldTextStyle()),
                  Text("Pizza de Queijo", style: AppWidget.lgboldTextStyle()),
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  if (a >= 1) {
                    a--;
                  }
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(12)),
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Text(a.toString(), style: AppWidget.mdBoldTextStyle()),
              SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: () {
                  a++;
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(12)),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          Text(
            "Descubra o prazer de uma pizza com massa leve, macia e incrivelmente fofinha, perfeita para quem busca uma experiência que combina textura aveludada com sabores irresistíveis.",
            style: AppWidget.smLightTextStyle(),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Row(
              children: [
                Text("Tempo de entrega", style: AppWidget.mdBoldTextStyle()),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.timer_outlined,
                  color: Colors.pink,
                ),
                SizedBox(
                  width: 10,
                ),
                Text("30 min", style: AppWidget.mdBoldTextStyle()),
              ],
            ),
          ),
          Spacer(),
          Padding(
              padding: EdgeInsets.only(bottom: 40.0),
              child: Row(children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("Valor", style: AppWidget.mdLightTextStyle()),
                  Text("R\$ 18,00", style: AppWidget.mdBoldTextStyle()),
                ]),
                Spacer(),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                Text("Adicionar",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold))
                              ])),
                    )
                  ],
                )
              ])),
        ]),
      ),
    );
  }
}
