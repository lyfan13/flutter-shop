import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:simpleshop/globaldata.dart';
// import 'package:simpleshop/afterlist.dart';
import 'package:simpleshop/share.dart';
import 'cart.dart';
import 'home.dart';
import 'Itemlist.dart';
import 'member.dart';

// void main() => runApp(MyApp());

void main() {
  runApp(MaterialApp(
    home: MyHome(),
  ));
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  static List<Widget> _widgetOptions = <Widget>[
    MyHomePage(),
    ItemList(), //临时改变的，为了能一直显示为这个页面
    Share(),
    Cart(),
    Member(),
  ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: navbarService.stream$,
      builder: (BuildContext context, AsyncSnapshot snap) {
        return Scaffold(
          backgroundColor: Colors.white,
          // body: Text('${snpa.data}'),
          // body: ShowOne(),
          body: _widgetOptions[navbarService.selectedIndex],
          // body: OutSideDetailPage(),
          // body: AfterList('http://129.204.49.171:6006/#/list/121'),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(OMIcons.home), title: Text('首页')),
              BottomNavigationBarItem(
                  icon: Icon(OMIcons.list), title: Text('分类')),
              BottomNavigationBarItem(
                  icon: Icon(OMIcons.explore), title: Text('分享')),
              BottomNavigationBarItem(
                  icon: Icon(OMIcons.shoppingCart), title: Text('购物车')),
              BottomNavigationBarItem(
                  icon: Icon(OMIcons.permIdentity), title: Text('个人')),
            ],
            currentIndex: navbarService.selectedIndex,
            selectedItemColor: Colors.redAccent,
            onTap: navbarService.changeNavBarIndex,
          ),
        );
      },
    );
  }
}
