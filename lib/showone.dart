import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:simpleshop/common/HomeItem.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:transparent_image/transparent_image.dart';
import 'common/GetIntrest.dart';
import 'common/tag.dart';
import 'globaldata.dart';
import 'main.dart';
import 'package:http/http.dart' as http;

fullWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

//单个商品的购买页面
class ShowOne extends StatefulWidget {
  final _id;
  ShowOne(this._id);
  // const ShowOne(this._id);
  @override
  _ShowOneState createState() => _ShowOneState();
}

class _ShowOneState extends State<ShowOne> {
  int _counter = 1;
  double scrollOffset = 0.0;
  double _barOpacity = 0.0;
  double _iconWrapOpacity = 0.2;
  double _iconOpacity = 0.0;
  bool _showadd = false;
  final contentController = TextEditingController();
  // Map product = {};
  List<Widget> showAddWidgets = List();
  int _itemCount = 1;

  bool _isShare = false; //是否显示分享栏

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
  }

  shareOne() {
    setState(() {
      _isShare = !_isShare;
    });
  }

  textWait(textvalue) {
    Future.delayed(Duration(milliseconds: 300), () {
      textvalue.isEmpty
          ? showDialog(
              context: context,
              builder: (_) => Center(
                      child: Container(
                    width: fullWidth() / 3,
                    color: Colors.black45,
                    child: Text(
                      '请输入内容',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: fullWidth() / 20,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  )))
          : postShare(widget._id.toString(), textvalue, userService.username);
    });
  }

  postShare(String itemid, String content, String user) async {
    if (userService.username.isEmpty) {
      showDialog(
          context: context,
          builder: (_) => Center(
                  child: Container(
                width: fullWidth() / 3,
                color: Colors.black45,
                child: Text(
                  '请先登录！',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: fullWidth() / 20,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              )));
      Future.delayed(Duration(milliseconds: 800), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyHome()),
        );
        navbarService.changeNavBarIndex(4);
      });
    } else {
      var data = await http.post('http://129.204.49.171:3000/flutter',
          body: {'user': user, 'content': content, 'itemid': itemid});
      var dedata = json.decode(data.body);
      print(dedata);
      if (dedata["code"] == 200) {
        showDialog(
            context: context,
            builder: (_) => Center(
                    child: Container(
                  width: fullWidth() / 3,
                  color: Colors.black45,
                  child: Text(
                    '提交成功',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: fullWidth() / 20,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                )));
      } else {
        showDialog(
            context: context,
            builder: (_) => Center(
                    child: Container(
                  width: fullWidth() / 3,
                  color: Colors.black45,
                  child: Text(
                    '服务器连接错误',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: fullWidth() / 20,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                )));
      }
    }
  }

  showAdd() {
    if (_showadd == false) {
      setState(() {
        _showadd = true;
      });
    } else {
      //之前有没添加过
      var templist = userService.cartList;
      templist.retainWhere((item) => item["id"] != widget._id);
      templist
          .add({"id": widget._id, "itemCount": _itemCount, "checked": true});
      userService.changeCart(templist);
      print(templist);
      showDialog(
          context: context,
          builder: (_) => Center(
                  child: Container(
                width: fullWidth() / 3,
                color: Colors.black45,
                child: Text(
                  '添加成功！',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: fullWidth() / 20,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              )));
      Future.delayed(Duration(milliseconds: 800), () {
        Navigator.pop(context);
        closeShowAdd();
      });
    }
  }

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
          width: fullWidth() / 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: HomeItem(oneItem: datalist[i]),
          ),
        ),
      ));
    }
    return maylikeWidgets;
  }

  closeShowAdd() {
    setState(() {
      _showadd = false;
      showAddWidgets = [
        SizedBox(
          height: 0.0,
          width: 0.0,
        )
      ];
    });
  }

  itemCountIncrement() {
    setState(() {
      _itemCount += 1;
    });
  }

  itemCountDecrement() {
    if (_itemCount > 1) {
      setState(() {
        _itemCount -= 1;
      });
    }
  }

  ScrollController _controller;
  _scrollListener() {
    setState(() {
      scrollOffset = _controller.offset;
      if (scrollOffset == 0) _barOpacity = 0.0;
      if (scrollOffset > 0 && scrollOffset <= 150) {
        _iconWrapOpacity = 0.2 - (0.2 / 150 * scrollOffset);
        _barOpacity = scrollOffset / 150;
        // _iconOpacity = (scrolloffset - 75) / 75;
      }
      if (scrollOffset > 75 && scrollOffset <= 150) {
        _iconOpacity = (scrollOffset - 75) / 75 * 0.5;
      }
    });
  }

  fullWidth() {
    return MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    routeToCart() {
      // Navigator.of(context)..pop()..pop();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyHome()),
      );
      navbarService.changeNavBarIndex(3);
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Stack(fit: StackFit.expand, children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: fullWidth() * 1.1, //改变这个数值可以引起放大视觉效果
                      child: Stack(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                //中间图片
                                child: Container(
                                    width: double.infinity,
                                    child: ShowOneSweper(widget._id)),
                              )
                            ],
                          ),
                          //count span
                        ],
                      ),
                    ),
                    Container(
                      color: Color(0xFFfe894a),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Image.network(
                              'http://yanxuan.nosdn.127.net/2e01053c3fed30b47ca2dc4786eeb24f.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: Container(
                              margin: EdgeInsets.only(left: 5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '津贴每满400减20',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: fullWidth() / 28),
                                  ),
                                  Text(
                                    '6.14-6.18可叠加使用',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: fullWidth() / 28),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    //价格介绍栏
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            //price
                            Row(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        '￥',
                                        style: TextStyle(
                                            fontFamily: 'HuaWen',
                                            color: Color(0xFFb4282d),
                                            fontSize: fullWidth() / 22),
                                      ),
                                      Text(
                                        '${widget._id}',
                                        style: TextStyle(
                                            color: Color(0xFFb4282d),
                                            fontWeight: FontWeight.bold,
                                            fontSize: fullWidth() / 15),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Tag('618特惠'),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 3.0, top: 8.0, bottom: 1.0, right: 1.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    '商品3',
                                    style: TextStyle(
                                        fontSize: fullWidth() / 25,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            Text(
                                              '100%',
                                              style: TextStyle(
                                                  fontSize: fullWidth() / 35,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFFb4282d)),
                                            ),
                                            Text(
                                              '好评率',
                                              style: TextStyle(
                                                fontSize: fullWidth() / 35,
                                              ),
                                            )
                                          ],
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: fullWidth() / 35,
                                          color: Colors.black26,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: fullWidth(),
                              margin: EdgeInsets.only(
                                  left: 5.0, right: 5.0, top: 2.0),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFFE7E7E7)),
                                  color: Color(0xFFf4f4f4)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  OneRec(1),
                                  OneRec(2),
                                  OneRec(3)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 8.0,
                      color: Color(0xFFf4f4f4),
                    ),
                    Container(
                      child: Container(
                        alignment: Alignment.center,
                        height: 30.0,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 2.0,
                                color: Color(0xFFff6600),
                              ),
                            ),
                          ),
                          child: Text(
                            '你可能还喜欢',
                            style: TextStyle(
                              color: Color(0xFFFF6600),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GetIntrest(),
                    Container(
                      color: Colors.black12,
                      width: fullWidth(),
                      height: fullWidth() / 5,
                    )
                  ],
                ),
              ),
              _isShare
                  ? Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: fullWidth() / 3,
                        width: fullWidth() / 1.3,
                        color: Colors.black26,
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    '输入分享内容',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                  InkWell(
                                    onTap: shareOne,
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: TextField(
                                controller: contentController,
                              ),
                            ),
                            SizedBox(
                              height: 12.0,
                            ),
                            InkWell(
                              onTap: () => textWait(contentController.text),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    '提交',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : SizedBox(
                      width: 0.0,
                      height: 0.0,
                    )
            ]),
            Positioned(
              top: 0.0,
              child: SafeArea(
                child: Container(
                  color: Colors.white.withOpacity(_barOpacity), //bar white
                  height: fullWidth() / 10,
                  width: fullWidth(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            InkWell(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                  margin: EdgeInsets.only(left: 8.0),
                                  decoration: BoxDecoration(
                                      color: Colors.black
                                          .withOpacity(_iconWrapOpacity), //xq cl
                                      shape: BoxShape.circle),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Icon(
                                      OMIcons.arrowBackIos,
                                      color: scrollOffset <= 75.0
                                          ? Colors.white
                                          : Colors.black
                                              .withOpacity(_iconOpacity),
                                      size: fullWidth() / 20,
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Opacity(
                            opacity: _barOpacity, //详情的过渡变化
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFF989994)),
                                  borderRadius: BorderRadius.circular(3.0)),
                              width: 102.0,
                              child: Container(
                                width: 50.0,
                                color: Color(0xFF858585),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      10.0, 2.0, 10.0, 2.0),
                                  child: Text(
                                    '商品${widget._id}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 13.0, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(left: 5.0, right: 3.0),
                                decoration: BoxDecoration(
                                    color: Colors.black
                                        .withOpacity(_iconWrapOpacity),
                                    shape: BoxShape.circle),
                                child: InkWell(
                                  onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyHome()),
                                      ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Icon(OMIcons.home,
                                        color: scrollOffset <= 75.0
                                            ? Colors.white
                                            : Colors.black
                                                .withOpacity(_iconOpacity),
                                        size: fullWidth() / 20),
                                  ),
                                )),
                            InkWell(
                              onTap: shareOne,
                              child: Container(
                                  margin: EdgeInsets.only(left: 5.0, right: 8.0),
                                  decoration: BoxDecoration(
                                      color: Colors.black
                                          .withOpacity(_iconWrapOpacity),
                                      shape: BoxShape.circle),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Icon(
                                      OMIcons.share,
                                      color: scrollOffset <= 75.0
                                          ? Colors.white
                                          : Colors.black
                                              .withOpacity(_iconOpacity),
                                      size: fullWidth() / 20,
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              child: Container(
                width: fullWidth(),
                height: fullWidth() / 8,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        top: BorderSide(
                      color: Colors.black12,
                    ))),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: routeToCart,
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            right: BorderSide(
                                                color: Colors.black26))),
                                    // height: fullWidth() / 3,
                                    child: Stack(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(OMIcons.shoppingCart,
                                              color: Color(0xFF515151)),
                                        ),
                                        StreamBuilder<Object>(
                                            stream: userService.cartListSteam$,
                                            builder: (context, snapshot) {
                                              return userService.cartList.length >
                                                      0
                                                  ? Positioned(
                                                      right: 2.0,
                                                      top: 2.0,
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: 15.0,
                                                        width: 15.0,
                                                        decoration: BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: Colors.red),
                                                        child: Text(
                                                          '${userService.cartList.length}',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    )
                                                  : SizedBox(
                                                      width: 0.0,
                                                    );
                                            })
                                      ],
                                    )),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: shareOne,
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            right: BorderSide(
                                                color: Colors.black26))),
                                    // height: fullWidth() / 3,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.share,
                                          color: Color(0xFF515151)),
                                    )),
                              ),
                            )
                          ],
                        )),
                    Expanded(
                        flex: 2,
                        child: InkWell(
                          onTap: showAdd,
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              '立即购买',
                              style: TextStyle(fontSize: fullWidth() / 28),
                            ),
                          ),
                        )),
                    Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: showAdd,
                        child: Container(
                          color: Colors.red,
                          alignment: Alignment.center,
                          child: Text(
                            '加入购物车',
                            style: TextStyle(
                                color: Colors.white, fontSize: fullWidth() / 28),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            (_showadd
                ? Positioned(
                    //蒙版
                    top: 0.0,
                    bottom: fullWidth() / 3,
                    child: Container(
                      color: Colors.black26,
                      width: fullWidth(),
                    ),
                  )
                : Container(
                    height: 0.0,
                    width: 0.0,
                  )),
            (_showadd
                ? Positioned(
                    bottom: fullWidth() / 8,
                    child: Container(
                      width: fullWidth(),
                      color: Colors.white,
                      height: fullWidth() / 2.2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 90.0,
                                    color: Color(0xFFF5F5F5),
                                    child: FadeInImage.memoryNetwork(
                                      placeholder: kTransparentImage,
                                      image:
                                          'http://pskxv51k0.bkt.clouddn.com/${widget._id}.png',
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              '￥${widget._id}',
                                              style: TextStyle(
                                                fontSize: 22.0,
                                                fontFamily: 'HuaWen',
                                                color: Color(0xFFb4282d),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text('已选:1件')
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 60.0),
                                    child: InkWell(
                                      onTap: closeShowAdd,
                                      child: Container(
                                        alignment: Alignment.topRight,
                                        child: Icon(Icons.close),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 10.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  height: fullWidth() / 10,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black12)),
                                  child: IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: itemCountDecrement,
                                    color: Colors.black45,
                                  ),
                                ),
                                Container(
                                  height: fullWidth() / 10,
                                  width: fullWidth() / 6,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black12)),
                                  child: Text('$_itemCount'),
                                ),
                                Container(
                                  height: fullWidth() / 10,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black12)),
                                  child: IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () => itemCountIncrement(),
                                    color: Colors.black45,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(
                    width: 0.0,
                    height: 0.0,
                  )),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // it is a good practice to dispose the controller
    contentController.dispose();
    super.dispose();
  }
}

class ShowOneSweper extends StatefulWidget {
  final id;
  ShowOneSweper(this.id);
  @override
  _ShowOneSweperState createState() => _ShowOneSweperState();
}

class _ShowOneSweperState extends State<ShowOneSweper> {
  List<Widget> _imageList = List();
  @override
  void initState() {
    _imageList
      ..add(Image.network(
        'http://pskxv51k0.bkt.clouddn.com/${widget.id}.png',
        fit: BoxFit.cover,
      ))
      ..add(Image.network(
        'http://pskxv51k0.bkt.clouddn.com/${widget.id}.png',
        fit: BoxFit.cover,
      ))
      ..add(Image.network(
        'http://pskxv51k0.bkt.clouddn.com/${widget.id}.png',
        fit: BoxFit.cover,
      ))
      ..add(Image.network(
        'http://pskxv51k0.bkt.clouddn.com/${widget.id}.png',
        fit: BoxFit.cover,
      ))
      ..add(Image.network(
        'http://pskxv51k0.bkt.clouddn.com/${widget.id}.png',
        fit: BoxFit.cover,
      ));
    super.initState();
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return (_imageList[index]);
  }

  @override
  Widget build(BuildContext context) {
    var _index = 1;
    changeIndex(i) {
      _index = i + 1;
    }

    return Swiper(
      onIndexChanged: changeIndex,
      itemBuilder: _swiperBuilder,
      itemCount: 5,
      pagination: SwiperCustomPagination(builder: (context, config) {
        return CountSpan(counter: _index);
      }),
      // loop: true,//无限循环
    );
  }
}

//推荐理由
class OneRec extends StatelessWidget {
  final int _index;
  const OneRec(this._index);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6.0, top: 2.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle, border: Border.all(color: Colors.red)),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                '$_index',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: fullWidth(context) / 35,
                    color: Colors.red),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Text(
              '优质产品 中国制造',
              style: TextStyle(fontSize: fullWidth(context) / 30),
            ),
          )
        ],
      ),
    );
  }
}

class CountSpan extends StatelessWidget {
  const CountSpan({
    Key key,
    @required int counter,
  })  : _counter = counter,
        super(key: key);

  final int _counter;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 10.0,
        right: 10.0,
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xFFffffff),
              border: Border.all(width: 0.1, color: Colors.black45)),
          child: Padding(
            padding: const EdgeInsets.only(left: 3.0, right: 3.0),
            child: Text('$_counter/5',
                style: TextStyle(
                    fontSize: fullWidth(context) / 28,
                    fontStyle: FontStyle.italic)),
          ),
        ));
  }
}
