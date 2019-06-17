import 'package:flutter/material.dart';
import 'package:simpleshop/showone.dart';
import 'package:transparent_image/transparent_image.dart';
import 'common/GetIntrest.dart';
import 'globaldata.dart';

double fullWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool _isOpen = true;
  addCart() {
    print(userService.cartSteam$);
  }

  void changeOpenStatus() {
    setState(() {
      _isOpen = !_isOpen;
    });
  }

  void deleteOne(_id) {
    var templist = userService.cartList;
    templist.retainWhere((item) => item["id"] != _id);
    userService.changeCart(templist);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 35.0,
            color: Colors.white, //手机号登录栏颜色
            child: Text(
              '购物车',
              style: TextStyle(fontSize: 17.0, color: Colors.black87),
            ),
          ),
          Container(
            height: 28.0,
            color: Colors.black12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  '30天无忧退货',
                  style: TextStyle(fontSize: 12.0),
                ),
                Text(
                  '48小时快速退款',
                  style: TextStyle(fontSize: 12.0),
                ),
                Text(
                  '满88元免邮费',
                  style: TextStyle(fontSize: 12.0),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: StreamBuilder<Object>(
                stream: userService.cartListSteam$,
                builder: (context, snapshot) {
                  return Column(
                    children: <Widget>[]
                      ..addAll(getCart())
                      ..add(
                        buildInkWell(),
                      )
                      ..add(
                        _isOpen
                            ? GetIntrest()
                            : SizedBox(
                                width: 0.0,
                              ),
                      ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  InkWell buildInkWell() {
    return InkWell(
      onTap: changeOpenStatus,
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 5.0, top: 5.0, bottom: 5.0),
          child: Row(
            children: <Widget>[
              Text(
                '你可能还会感兴趣的',
                style: TextStyle(
                    fontStyle: FontStyle.italic, color: Colors.black54),
              ),
              Icon((_isOpen ? Icons.arrow_drop_down : Icons.arrow_drop_up),
                  color: Colors.black54)
            ],
          ),
        ),
        margin: EdgeInsets.only(top: 24.0),
        decoration: BoxDecoration(
            color: (_isOpen ? Color(0xFFff6600) : Colors.blueAccent)),
      ),
    );
  }

  List<Widget> getCart() {
    List<Widget> list = List<Widget>();
    if (userService.cartList.length > 0) {
      for (var i = 0; i < userService.cartList.length; i++) {
        list.add(Container(
          color: Color(0xFFf4f4f4),
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 8.0),
                    height: fullWidth(context) / 4,
                    decoration: BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.black12))),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Icon(
                            (userService.cartList[i]["checked"]
                                ? Icons.check_circle_outline
                                : Icons.radio_button_unchecked),
                            color: userService.cartList[i]["checked"]
                                ? Colors.blueAccent
                                : Colors.black.withOpacity(.1),
                            size: fullWidth(context) / 18,
                          ), //Icons.check_circle_outline
                        ),
                        Expanded(
                          flex: 11,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 3,
                                child: InkWell(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ShowOne(
                                              userService.cartList[i]["id"]))),
                                  child: Container(
                                    margin: EdgeInsets.all(1.0),
                                    child: FadeInImage.memoryNetwork(
                                      image:
                                          "http://pskxv51k0.bkt.clouddn.com/${userService.cartList[i]['id']}.png",
                                      placeholder: kTransparentImage,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                //price
                                flex: 5,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () => userService.changeChecked(i),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                            '商品${userService.cartList[i]['id']}'),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 12.0),
                                          child: Text(
                                            '1件',
                                            style: TextStyle(
                                                color: Colors.black26),
                                          ),
                                        ),
                                        Text(
                                          '￥${userService.cartList[i]['id']}',
                                          style: TextStyle(
                                              fontFamily: 'HuaWen',
                                              color: Colors.redAccent,
                                              fontSize:
                                                  fullWidth(context) / 20),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                //stepper
                                flex: 5,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Container(
                                    alignment: Alignment.bottomCenter,
                                    margin: EdgeInsets.only(right: 10.0),
                                    child: Container(
                                      height: fullWidth(context) / 12,
                                      margin: EdgeInsets.only(
                                          left: 10.0,
                                          right: 10.0,
                                          bottom: 10.0),
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black12),
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              child: FittedBox(
                                                child: IconButton(
                                                  icon: Icon(Icons.remove),
                                                  iconSize: 40.0,
                                                  onPressed: () => userService
                                                      .oneDecrement(i),
                                                  color: Colors.black45,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.black12)),
                                              child: Text(
                                                  '${userService.cartList[i]["itemCount"]}'),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              child: FittedBox(
                                                child: IconButton(
                                                  iconSize: 40.0,
                                                  icon: Icon(Icons.add),
                                                  onPressed: () => userService
                                                      .oneIncrement(i),
                                                  color: Colors.black45,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: fullWidth(context) / 25,
                    right: fullWidth(context) / 10,
                    child: InkWell(
                      onTap: () => deleteOne(userService.cartList[i]['id']),
                      child: Container(
                        child: Icon(
                          Icons.delete_forever,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
      }
    } else {
      list = [
        Container(
          //快点添加点什么吧
          color: Color(0xFFf4f4f4),
          width: double.infinity,
          height: 280.0,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        height: 70.0,
                        width: 70.0,
                        child: FadeInImage.memoryNetwork(
                          image:
                              'http://yanxuan-static.nosdn.127.net/hxm/yanxuan-wap/p/20161201/style/img/icon-normal/noCart-d6193bd6e4.png',
                          placeholder: kTransparentImage,
                        ),
                      ),
                      Text(
                        '快去添加点什么吧',
                        style: TextStyle(color: Color(0xFFA3A3A3)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ];
    }
    return list;
  }


}
