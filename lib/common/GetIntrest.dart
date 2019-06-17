import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../showone.dart';
import 'HomeItem.dart';

class GetIntrest extends StatefulWidget {
  @override
  _GetIntrestState createState() => _GetIntrestState();
}

class _GetIntrestState extends State<GetIntrest> {
  fetchInterest() async {
    var resdata = await http.get('http://129.204.49.171:5005/json/111');
    Map listdata = json.decode(resdata.body);
    print(listdata["data"][1]["itemlist"]);
    return listdata["data"][1]["itemlist"];
  }

  fullWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  Future _listdata;

  createMayLikeWidget(datalist) {
    List<Widget> maylikeWidgets = List<Widget>();
    for (var i = 0; i < datalist.length; i++) {
      maylikeWidgets.add(InkWell(
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ShowOne(datalist[i]["price"])),
            ),
        child: Container(
          width: fullWidth(context) / 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: HomeItem(oneItem: datalist[i]),
          ),
        ),
      ));
    }
    return maylikeWidgets;
  }

  @override
  void initState() {
    super.initState();
    _listdata = fetchInterest();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _listdata,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return new Text('start');
            case ConnectionState.active:
            case ConnectionState.waiting:
              return new Text('连接数据中...');
            case ConnectionState.done:
              if (snapshot.hasError)
                return new Text('Error: ${snapshot.error}');
              return Wrap(
                children: createMayLikeWidget(snapshot.data),
              );
          }
          return null;
        });
  }
}
