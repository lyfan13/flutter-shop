import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:http/http.dart' as http;

import 'showone.dart';

double fullWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

class Share extends StatefulWidget {
  @override
  _ShareState createState() => _ShareState();
}

class _ShareState extends State<Share> {
  fetchShare() async {
    var _shareData = await http.get('http://129.204.49.171:3000/flutter');
    Map shareList = json.decode(_shareData.body);
    // print(_shareList["data"]);
    return shareList["data"];
  }

  Future _shareList;
  List<Widget> createShareWidget(listdata) {
    List<Widget> tempList = List<Widget>();
    for (var i = 0; i < listdata.length; i++) {
      tempList.add(Container(
        color: Color(0xFFF4F4F4),
        child: Container(
          margin: EdgeInsets.only(top: fullWidth(context) / 48),
          height: fullWidth(context) / 3,
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: InkWell(
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ShowOne(listdata[i]["itemid"])),
                      ),
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    color: Color(0xFFff6600).withOpacity(.2),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image:
                          'http://pskxv51k0.bkt.clouddn.com/${listdata[i]["itemid"]}.png',
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  margin: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        height: fullWidth(context) / 14,
                        child: Text(
                          '“',
                          style: TextStyle(
                              color: Colors.red.withOpacity(.8),
                              fontSize: fullWidth(context) / 8),
                        ),
                      ),
                      Container(
                          alignment: Alignment.center,
                          height: fullWidth(context) / 14,
                          child: Text(
                            listdata[i]["content"],
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: fullWidth(context) / 20),
                          )),
                      Container(
                        alignment: Alignment.centerRight,
                        height: fullWidth(context) / 14,
                        child: Text(
                          '”',
                          style: TextStyle(
                              color: Colors.red.withOpacity(.8),
                              fontSize: fullWidth(context) / 8),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: FittedBox(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFff6600),
                                borderRadius: BorderRadius.circular(8.0)),
                            height: fullWidth(context) / 14,
                            child: Container(
                                margin: EdgeInsets.all(8.0),
                                alignment: Alignment.center,
                                child: Text(
                                  listdata[i]["user"],
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ));
    }
    return tempList;
  }

  @override
  void initState() {
    super.initState();
    _shareList = fetchShare();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          //appbar
          Container(
            height: fullWidth(context) / 4.5,
            width: double.infinity,
            color: Colors.amberAccent.withOpacity(.5),
            child: SafeArea(
              child: Center(
                child: Text(
                  '发现',
                  style: TextStyle(
                      color: Color(0xFFb4282d),
                      fontSize: fullWidth(context) / 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          FutureBuilder(
            future: _shareList,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return new Text('start');
                case ConnectionState.waiting:
                  return new Text('连接数据中...');
                default:
                  if (snapshot.hasError)
                    return new Text('木有数据');
                  else
                    print(snapshot.data);
                  return Column(
                    children: createShareWidget(snapshot.data),
                  );
              }
            },
          )
        ],
      ),
    );
  }
}
