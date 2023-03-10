import 'package:flutter/material.dart';
import 'package:rtcoin/pages/home/index.dart';
import 'package:rtcoin/pages/mine/index.dart';
import 'package:rtcoin/pages/notice/index.dart';
import 'package:rtcoin/pages/order/index.dart';

class Toolbar extends StatefulWidget {
  const Toolbar({Key? key}) : super(key: key);

  @override
  State<Toolbar> createState() => _ToolbarState();
}

class _ToolbarState extends State<Toolbar> {
  int cuttentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          Home(),
          Order(),
          Notice(),
          Mine(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color.fromRGBO(250, 249, 249, 1),
        unselectedItemColor: const Color.fromRGBO(244, 245, 245, 0.557),
        backgroundColor: const Color.fromRGBO(1, 1, 1, 1),
        currentIndex: cuttentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _pageController.jumpToPage(index);
            cuttentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '商城',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: '消息',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '我的',
          ),
        ],
      ),
    );
  }
}
