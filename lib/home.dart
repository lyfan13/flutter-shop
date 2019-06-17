import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:simpleshop/globaldata.dart';
import 'package:transparent_image/transparent_image.dart';

import 'common/HomeItem.dart';
import 'common/tag.dart';
import 'showone.dart';

double fullWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

class MyHomePage extends StatelessWidget {
  final _aData = [
    //轮播图下面的导航的数据
    {"title": "美食酒水", "imgurl": "http://pskxv51k0.bkt.clouddn.com/3.png"},
    {"title": "服饰鞋包", "imgurl": "http://pskxv51k0.bkt.clouddn.com/2.png"},
    {"title": "居家生活", "imgurl": "http://pskxv51k0.bkt.clouddn.com/1.png"},
    {"title": "数码家电", "imgurl": "http://pskxv51k0.bkt.clouddn.com/4.png"},
    {"title": "运动旅行", "imgurl": "http://pskxv51k0.bkt.clouddn.com/5.png"}
  ];
  final _recData = [
    {
      "title": "英国设计 便携式榨汁杯",
      "imgurl": "http://pskxv51k0.bkt.clouddn.com/381.png",
      "dsc": "40秒鲜果饮，随身现榨鲜喝",
      "price": "381",
      "tag": "好货内部价"
    },
    [
      {
        "title": "常温纯牛奶",
        "imgurl": "http://pskxv51k0.bkt.clouddn.com/382.png",
        "price": "382",
        "delprice": '',
        "tag": "好货内部价",
        "insidetag": ""
      },
      {
        "title": "男式Polo衫",
        "imgurl": "http://pskxv51k0.bkt.clouddn.com/383.png",
        "price": "383",
        "delprice": '',
        "tag": "好货内部价",
        "insidetag": "8色可选"
      },
      {
        "title": "网易沐足盘",
        "imgurl": "http://pskxv51k0.bkt.clouddn.com/384.png",
        "price": "384",
        "delprice": '',
        "tag": "好货内部价",
        "insidetag": ""
      },
    ]
  ];
  final _secData = [
    [
      '每日秒杀',
      [
        {
          "title": "",
          "price": "356",
          "delprice": "499",
          "tag": "",
          "insideTag": "",
          "imgurl": "http://pskxv51k0.bkt.clouddn.com/356.png",
          "horizon": ''
        },
        {
          "title": "",
          "price": "357",
          "delprice": "499",
          "tag": "",
          "insideTag": "",
          "imgurl": "http://pskxv51k0.bkt.clouddn.com/357.png",
          "horizon": ''
        },
        {
          "title": "",
          "price": "300",
          "delprice": "480",
          "tag": "",
          "insideTag": "",
          "imgurl": "http://pskxv51k0.bkt.clouddn.com/300.png",
          "horizon": ''
        },
        {
          "title": "",
          "price": "359",
          "delprice": "400",
          "tag": "",
          "insideTag": "",
          "imgurl": "http://pskxv51k0.bkt.clouddn.com/359.png",
          "horizon": ''
        },
        {
          "title": "",
          "price": "360",
          "delprice": "370",
          "tag": "",
          "insideTag": "",
          "imgurl": "http://pskxv51k0.bkt.clouddn.com/360.png",
          "horizon": ''
        },
        {
          "title": "",
          "price": "361",
          "delprice": "470",
          "tag": "",
          "insideTag": "",
          "imgurl": "http://pskxv51k0.bkt.clouddn.com/361.png",
          "horizon": ''
        }
      ]
    ],
    [
      '新品首发',
      [
        {
          "title": "精华洗面奶",
          "price": "251",
          "delprice": "",
          "tag": "618特惠",
          "insideTag": "日本设计",
          "imgurl": "http://pskxv51k0.bkt.clouddn.com/251.png",
          "horizon": ''
        },
        {
          "title": "泰国枕头",
          "price": "252",
          "delprice": "",
          "tag": "618特惠",
          "insideTag": "泰国",
          "imgurl": "http://pskxv51k0.bkt.clouddn.com/252.png",
          "horizon": ''
        },
        {
          "title": "皮包",
          "price": "253",
          "delprice": "",
          "tag": "",
          "insideTag": "2色可选",
          "imgurl": "http://pskxv51k0.bkt.clouddn.com/253.png",
          "horizon": ''
        },
        {
          "title": "补水精华",
          "price": "254",
          "delprice": "",
          "tag": "618特惠",
          "insideTag": "",
          "imgurl": "http://pskxv51k0.bkt.clouddn.com/254.png",
          "horizon": ''
        },
        {
          "title": "网易沐足盘",
          "price": "255",
          "delprice": "",
          "tag": "",
          "insideTag": "2色可选",
          "imgurl": "http://pskxv51k0.bkt.clouddn.com/255.png",
          "horizon": ''
        },
        {
          "title": "丝滑睡衣",
          "price": "256",
          "delprice": "",
          "tag": "618特惠",
          "insideTag": "日本设计",
          "imgurl": "http://pskxv51k0.bkt.clouddn.com/256.png",
          "horizon": ''
        }
      ]
    ]
  ];
  final _bigImgData = [
    [
      'http://pskxv51k0.bkt.clouddn.com/972.jpg',
      [
        {
          "title": "男士牛仔裤",
          "price": "41",
          "delprice": "229",
          "tag": "618特惠",
          "insideTag": "2色可选",
          "imgurl": "http://pskxv51k0.bkt.clouddn.com/41.png",
          "horizon": '1'
        },
        {
          "title": "男士休闲裤",
          "price": "42",
          "delprice": "259",
          "tag": "618特惠",
          "insideTag": "2色可选",
          "imgurl": "http://pskxv51k0.bkt.clouddn.com/42.png",
          "horizon": '1'
        },
        {
          "title": "追风跑鞋",
          "price": "43",
          "delprice": "",
          "tag": "好货内部价",
          "insideTag": "3色可选",
          "imgurl": "http://pskxv51k0.bkt.clouddn.com/43.png",
          "horizon": '1'
        },
        {
          "title": "真丝衬衫",
          "price": "44",
          "delprice": "449",
          "tag": "618特惠",
          "insideTag": "3色可选",
          "imgurl": "http://pskxv51k0.bkt.clouddn.com/44.png",
          "horizon": '1'
        },
        {
          "title": "男士polo衫",
          "price": "45",
          "delprice": "89",
          "tag": "618特惠",
          "insideTag": "8色可选",
          "imgurl": "http://pskxv51k0.bkt.clouddn.com/45.png",
          "horizon": '1'
        },
        {
          "title": "男士T恤",
          "price": "46",
          "delprice": "49",
          "tag": "618特惠",
          "insideTag": "8色可选",
          "imgurl": "http://pskxv51k0.bkt.clouddn.com/46.png",
          "horizon": '1'
        },
        {
          "title": "女士T恤",
          "price": "47",
          "delprice": "119",
          "tag": "618特惠",
          "insideTag": "4色可选",
          "imgurl": "http://pskxv51k0.bkt.clouddn.com/47.png",
          "horizon": '1'
        }
      ]
    ],
    [
      'http://pskxv51k0.bkt.clouddn.com/jiadian.jpg',
      [
        {
          "title": "USB充电器",
          "price": "51",
          "delprice": "",
          "tag": "3件7.5折",
          "insideTag": "",
          "imgurl": "http://pskxv51k0.bkt.clouddn.com/51.png",
          "horizon": '1'
        },
        {
          "title": "壁挂小夜灯",
          "price": "52",
          "delprice": "259",
          "tag": "3件7.5折",
          "insideTag": "",
          "imgurl": "http://pskxv51k0.bkt.clouddn.com/52.png",
          "horizon": '1'
        },
        {
          "title": "智能马桶盖",
          "price": "53",
          "delprice": "1599",
          "tag": "限时购",
          "insideTag": "",
          "imgurl": "http://pskxv51k0.bkt.clouddn.com/53.png",
          "horizon": '1'
        },
        {
          "title": "3D揉捏按摩肩带",
          "price": "54",
          "delprice": "",
          "tag": "每满99-15",
          "insideTag": "",
          "imgurl": "http://pskxv51k0.bkt.clouddn.com/54.png",
          "horizon": '1'
        },
        {
          "title": "大师椅",
          "price": "55",
          "delprice": "11999",
          "tag": "定金购",
          "insideTag": "",
          "imgurl": "http://pskxv51k0.bkt.clouddn.com/55.png",
          "horizon": '1'
        },
        {
          "title": "拖地机器人",
          "price": "56",
          "delprice": "",
          "tag": "定金购",
          "insideTag": "",
          "imgurl": "http://pskxv51k0.bkt.clouddn.com/56.png",
          "horizon": '1'
        },
        {
          "title": "随身杯",
          "price": "57",
          "delprice": "",
          "tag": "每满149-30",
          "insideTag": "",
          "imgurl": "http://pskxv51k0.bkt.clouddn.com/57.png",
          "horizon": '1'
        },
        {
          "title": "便携投影仪",
          "price": "58",
          "delprice": "3199",
          "tag": "限时购",
          "insideTag": "",
          "imgurl": "http://pskxv51k0.bkt.clouddn.com/58.png",
          "horizon": '1'
        },
      ]
    ]
  ];

  routeToItemlist(index){
    navbarService.changeNavBarIndex(1);
    liseIndexService.changeItemListIndex(index);
  }

  //轮播图后面的导航组件
  List<Widget> afterSweper(context) {
    List<Widget> _nav = List<Widget>();
    for (var i = 0; i < _aData.length; i++) {
      _nav.add(Expanded(
        flex: 1,
        child: InkWell(
          onTap:()=> routeToItemlist(i),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: _aData[i]["imgurl"],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    _aData[i]["title"],
                    style: TextStyle(fontSize: fullWidth(context) / 32),
                  ),
                )
              ],
            ),
          ),
        ),
      ));
    }
    return _nav;
  }

  //人气推荐类组件 _recData[1]
  Widget recommand(bData, context) {
    List<Widget> threeImg = List<Widget>();
    List secondRowData = bData[1];
    for (var i = 0; i < secondRowData.length; i++) {
      threeImg.add(Expanded(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: InkWell(
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShowOne(secondRowData[i]["price"])),
                ),
            child: Stack(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      color: Color(0xFFF5F5F5),
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: secondRowData[i]["imgurl"],
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        ItemTitle(secondRowData[i]["title"]),
                        PriceText(secondRowData[i]["price"], ''),
                      ],
                    ),
                    Tag(secondRowData[i]["tag"])
                  ],
                ),
                (secondRowData[i]["insidetag"].isEmpty
                    ? SizedBox(
                        width: 0.0,
                        height: 0.0,
                      )
                    : InsideTag(secondRowData[i]["insidetag"]))
              ],
            ),
          ),
        ),
      ));
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Align(
                  child: Text(
                    '人气推荐',
                    style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: fullWidth(context) / 28),
                  ),
                  alignment: Alignment.centerLeft,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                      child: Container(
                          width: 50.0,
                          // color: Colors.greenAccent,
                          child: Row(
                            children: <Widget>[
                              Text(
                                '更多',
                                style: TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: fullWidth(context) / 28),
                              ),
                              Icon(Icons.arrow_forward_ios,
                                  size: 15.0, color: Color(0xFF333333))
                            ],
                          ))),
                  // Icon(Icons.arrow_forward_ios)
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            color: Color(0xFFFEF0DF),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: InkWell(
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShowOne(bData[0]["price"])),
                    ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: bData[0]["imgurl"],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Tag(bData[0]["tag"]),
                          Text(bData[0]["title"]),
                          Text(
                            bData[0]["dsc"],
                            style: TextStyle(color: Color(0xFF7F7F7F)),
                          ),
                          PriceText(bData[0]["price"], ''),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[]..addAll(threeImg),
            ),
          )
        ],
      ),
    );
  }

  //大图组件
  Widget bigImg(_imgData, context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Container(
            height: fullWidth(context) / 2,
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: _imgData[0], //url
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: fullWidth(context) / 2,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _imgData[1].length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ShowOne(_imgData[1][index]["price"])),
                      ),
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    width: 112.0,
                    child: HomeItem(oneItem: _imgData[1][index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //导航栏
        Container(
          color: Colors.red,
          height: fullWidth(context) / 4.5,
          child: SafeArea(
            minimum: EdgeInsets.zero,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // 扫二维码
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.crop_free,
                          color: Colors.white,
                          size: fullWidth(context) / 25,
                        ),
                        Text(
                          '扫一扫',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: fullWidth(context) / 42),
                        )
                      ],
                    ),
                  ),
                ),
                // 搜索
                Expanded(
                  flex: 8,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0)),
                    height: fullWidth(context) / 14,
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.search,
                          color: Colors.black38,
                          size: fullWidth(context) / 18,
                        ),
                        Text(
                          ' 男/女 色画轻主义人字凉拖鞋',
                          style: TextStyle(
                              color: Colors.black38,
                              fontSize: fullWidth(context) / 28),
                        )
                      ],
                    ),
                  ),
                ),
                // 消息
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.face,
                          size: fullWidth(context) / 25,
                          color: Colors.white,
                        ),
                        Text(
                          '信 息',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: fullWidth(context) / 42),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //中间body
        Expanded(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: <Widget>[
                //轮播图
                Container(
                  height: fullWidth(context) / 2,
                  child: Stack(
                    children: <Widget>[
                      //背景红色
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: fullWidth(context) / 4,
                          color: Colors.red,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: HomeSwiper(),
                          ),
                        ),
                      )
                      // 轮播图
                    ],
                  ),
                ),
                ThreeSpan(),
                //轮播后的导航
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                  child: Row(
                    children: <Widget>[]..addAll(afterSweper(context)),
                  ),
                ),
                //中间gif图
                Container(
                  //http://pskxv51k0.bkt.clouddn.com/zhuan.png

                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: 'http://pskxv51k0.bkt.clouddn.com/go.gif',
                        ),
                      ),
                      Positioned(
                          top: fullWidth(context) / 20,
                          left: fullWidth(context) / 10,
                          child: Container(
                            width: fullWidth(context) / 5,
                            height: fullWidth(context) / 5,
                            child: InkWell(
                              onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ShowOne(38)),
                                  ),
                              child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image:
                                    'http://pskxv51k0.bkt.clouddn.com/38.png',
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                Wall(),
                //人气推荐
                recommand(_recData, context),
                Wall(),
                SecKill(_secData[0][0], _secData[0][1]),
                Wall(),
                SecKill(_secData[1][0], _secData[1][1]),
                Wall(),
                bigImg(_bigImgData[0], context),
                Wall(),
                bigImg(_bigImgData[1], context),
                Wall(),
              ],
            ),
          ),
        ),
      ],
    );
    //底部导航
    // bottomNavigationBar: BottomNavBar());
  }
}

//网易自营品牌x3
class ThreeSpan extends StatelessWidget {
  const ThreeSpan({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double smallWidth = fullWidth(context) / 37;
    return Padding(
      padding: const EdgeInsets.only(
        left: 13.0,
        right: 13.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.fiber_new,
                    color: Colors.redAccent,
                    size: smallWidth,
                  ),
                  Text(
                    '网易自营品牌',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: smallWidth,
                    ),
                  ),
                ],
              )
            ],
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.verified_user,
                    color: Colors.redAccent,
                    size: smallWidth,
                  ),
                  Text(
                    '30天无忧退货',
                    style: TextStyle(
                        color: Colors.redAccent, fontSize: smallWidth),
                  )
                ],
              )
            ],
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.autorenew,
                    color: Colors.redAccent,
                    size: smallWidth,
                  ),
                  Text(
                    '48小时快速退款',
                    style: TextStyle(
                        color: Colors.redAccent, fontSize: smallWidth),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

//
class Wall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF4F4F4),
      height: 8.0,
    );
  }
}

class SecKill extends StatelessWidget {
  final String bannerTitle; //'每日秒杀'
  final List itemList;
  const SecKill(
    this.bannerTitle,
    this.itemList, {
    Key key,
  }) : super(key: key);

  List<Widget> sixImg(context) {
    List<Widget> _temp = [];
    for (var i = 0; i < itemList.length; i++) {
      _temp.add(
        InkWell(
          onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ShowOne(itemList[i]["price"])),
              ),
          child: Container(
              margin: EdgeInsets.all(5.0),
              width: fullWidth(context) / 3.5,
              child: HomeItem(
                oneItem: itemList[i],
              )),
        ),
      );
    }
    return _temp;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 5.0),
            child: Stack(
              children: <Widget>[
                Align(
                  child: Text(
                    bannerTitle, //bannerTitle
                    style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: fullWidth(context) / 28),
                  ),
                  alignment: Alignment.centerLeft,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    child: Container(
                      width: 50.0,
                      // color: Colors.greenAccent,
                      child: Row(
                        children: <Widget>[
                          Text(
                            '更多',
                            style: TextStyle(
                                color: Color(0xFF333333),
                                fontSize: fullWidth(context) / 28),
                          ),
                          Icon(Icons.arrow_forward_ios,
                              size: fullWidth(context) / 28,
                              color: Color(0xFF333333))
                        ],
                      ),
                    ),
                  ),
                  // Icon(Icons.arrow_forward_ios)
                ),
              ],
            ),
          ),
          Container(
            child: Wrap(
              children: sixImg(context),
            ),
          )
        ],
      ),
    );
  }
}

//轮播图
class HomeSwiper extends StatefulWidget {
  @override
  _HomeSwiperState createState() => _HomeSwiperState();
}

class _HomeSwiperState extends State<HomeSwiper> {
  List<Widget> imageList = List();
  @override
  void initState() {
    imageList
      ..add(Image.network(
        'http://pskxv51k0.bkt.clouddn.com/1.jpg',
        fit: BoxFit.fill,
      ))
      ..add(Image.network(
        'http://pskxv51k0.bkt.clouddn.com/2.jpg',
        fit: BoxFit.fill,
      ))
      ..add(Image.network(
        'http://pskxv51k0.bkt.clouddn.com/3.jpg',
        fit: BoxFit.fill,
      ))
      ..add(Image.network(
        'http://pskxv51k0.bkt.clouddn.com/4.jpg',
        fit: BoxFit.fill,
      ))
      ..add(Image.network(
        'http://pskxv51k0.bkt.clouddn.com/5.jpg',
        fit: BoxFit.fill,
      ));
    super.initState();
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return (imageList[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: _swiperBuilder,
      itemCount: 5,
      pagination: SwiperPagination(),
      // loop: true,//无限循环
      autoplay: true,
    );
  }
}
