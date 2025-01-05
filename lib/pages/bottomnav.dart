import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mordidinha/pages/home.dart';
import 'package:mordidinha/pages/order.dart';
import 'package:mordidinha/pages/profile.dart';
import 'package:mordidinha/pages/wallet.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTabIndex = 0;

  late List<Widget> pages;

  late Widget currentPage;

  late Home homepage;
  late Profile profilepage;
  late Order orderpage;
  late Wallet walletpage;
  @override
  void initState() {
    homepage = Home();
    profilepage = Profile();
    orderpage = Order();
    walletpage = Wallet();
    pages = [homepage, orderpage, walletpage, profilepage];

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: Colors.white,
        color: Colors.pink,
        animationDuration: Duration(milliseconds: 200),
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
          });
        },
        items: [
          Icon(Icons.home_outlined, color: Colors.white),
          Icon(Icons.shopping_bag_outlined, color: Colors.white),
          Icon(Icons.wallet_outlined, color: Colors.white),
          Icon(Icons.person_outline, color: Colors.white),
        ],
      ),
      body: pages[currentTabIndex],
    );
  }
}
