import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'afterlist.dart';
import 'globaldata.dart';

fullWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

class ItemList extends StatefulWidget {
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  // int _selectedIndex = 0;//change
  List itemList = [
    '美食酒水',
    '服饰鞋包',
    '居家生活',
    '数码家电',
    '运动旅行',
    '个护清洁',
    '母婴亲子',
  ];
  List allData = [
    {
      "imgurl": 'http://pskxv51k0.bkt.clouddn.com/list01.png',
      "list": [
        {
          "name": "精选美食",
          "list": [
            {
              "title": "618同价专区",
              "id": 111,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/011.png"
            },
            {
              "title": "蜜饯果干",
              "id": 112,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/012.png"
            },
            {
              "title": "坚果炒货",
              "id": 113,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/013.png"
            },
            {
              "title": "肉类零食",
              "id": 114,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/014.png"
            }
          ]
        },
        {
          "name": "休闲零食",
          "list": [
            {
              "title": "小时糖巧",
              "id": 121,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/015.png"
            },
            {
              "title": "饼干糕点",
              "id": 122,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/016.png"
            },
            {
              "title": "好味精选",
              "id": 123,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/017.png"
            }
          ]
        },
        {
          "name": "坚果蜜饯 ",
          "list": [
            {
              "title": "夏季推荐",
              "id": 131,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/018.png"
            },
            {
              "title": "新品首发",
              "id": 132,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/019.png"
            }
          ]
        },
      ]
    },
    {
      "imgurl": 'http://pskxv51k0.bkt.clouddn.com/list02.jpg',
      "list": [
        {
          "name": "当季热销",
          "list": [
            {
              "title": "618爆款",
              "id": 211,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0201.png"
            },
            {
              "title": "夏季新品",
              "id": 212,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0202.png"
            },
            {
              "title": "清凉系列",
              "id": 213,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0203.png"
            },
            {
              "title": "第二件6折",
              "id": 214,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0204.png"
            },
          ]
        },
        {
          "name": "男装",
          "list": [
            {
              "title": "男式polo",
              "id": 221,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0207.png"
            },
            {
              "title": "男士衬衫",
              "id": 222,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0208.png"
            },
            {
              "title": "男士裤装",
              "id": 223,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0209.png"
            },
          ]
        },
        {
          "name": "女装 ",
          "list": [
            {
              "title": "女士polo",
              "id": 231,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0211.png"
            },
            {
              "title": "女士衬衫",
              "id": 232,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0212.png"
            }
          ]
        },
      ]
    },
    {
      "imgurl": 'http://pskxv51k0.bkt.clouddn.com/list03.jpg',
      "list": [
        {
          "name": "春夏换新",
          "list": [
            {
              "title": "618必买",
              "id": 311,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0301.png"
            },
            {
              "title": "夏凉热卖",
              "id": 312,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0302.png"
            },
            {
              "title": "主题床品",
              "id": 313,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0303.png"
            },
            {
              "title": "天女散花",
              "id": 314,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/1010.png"
            }
          ]
        },
        {
          "name": "家纺床品",
          "list": [
            {
              "title": "床品件套",
              "id": 321,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0304.png"
            },
            {
              "title": "被枕盖毯",
              "id": 322,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0305.png"
            },
            {
              "title": "床垫床褥",
              "id": 323,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0306.png"
            }
          ]
        },
        {
          "name": "家居家装 ",
          "list": [
            {
              "title": "客餐厅家具",
              "id": 331,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0307.png"
            },
            {
              "title": "卧室家具",
              "id": 332,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0308.png"
            },
          ]
        },
      ]
    },
    {
      "imgurl": 'http://pskxv51k0.bkt.clouddn.com/list07.jpg',
      "list": [
        {
          "name": "好货精选",
          "list": [
            {
              "title": "甄选爆款",
              "id": 711,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0701.png"
            },
            {
              "title": "当即热卖",
              "id": 712,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0702.png"
            },
            {
              "title": "颜值好物",
              "id": 713,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0703.png"
            },
            {
              "title": "编辑挑选",
              "id": 714,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/1015.png"
            }
          ]
        },
        {
          "name": "个护电器",
          "list": [
            {
              "title": "口腔护理",
              "id": 721,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0704.png"
            },
            {
              "title": "身体护理",
              "id": 722,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0705.png"
            },
            {
              "title": "面部护理",
              "id": 723,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0706.png"
            }
          ]
        },
        {
          "name": "生活电器 ",
          "list": [
            {
              "title": "清洁电器",
              "id": 731,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0708.png"
            },
            {
              "title": "衣物护理",
              "id": 732,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0709.png"
            }
          ]
        },
      ]
    },
    {
      "imgurl": 'http://pskxv51k0.bkt.clouddn.com/list06.jpg',
      "list": [
        {
          "name": "当季热销",
          "list": [
            {
              "title": "夏季清凉防嗮",
              "id": 611,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0601.png"
            },
            {
              "title": "瑜伽系列",
              "id": 612,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0602.png"
            },
            {
              "title": "出行好物",
              "id": 613,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0603.png"
            },
            {
              "title": "出行好物",
              "id": 614,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/1014.png"
            }
          ]
        },
        {
          "name": "运动男装",
          "list": [
            {
              "title": "男式polo衫",
              "id": 621,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0604.png"
            },
            {
              "title": "男式卫衣",
              "id": 622,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0605.png"
            },
            {
              "title": "男式运动裤",
              "id": 623,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0606.png"
            }
          ]
        },
        {
          "name": "运动女装 ",
          "list": [
            {
              "title": "女士polo",
              "id": 631,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0607.png"
            },
            {
              "title": "女士运动内衣",
              "id": 632,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0608.png"
            }
          ]
        },
      ]
    },
    {
      "imgurl": 'http://pskxv51k0.bkt.clouddn.com/list04.jpg',
      "list": [
        {
          "name": "好物精选",
          "list": [
            {
              "title": "爆款榜单",
              "id": 411,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0401.png"
            },
            {
              "title": "新品尝鲜",
              "id": 412,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0402.png"
            },
            {
              "title": "新品尝鲜",
              "id": 413,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/1011.png"
            },
            {
              "title": "新品尝鲜",
              "id": 414,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/1012.png"
            }
          ]
        },
        {
          "name": "面部护理",
          "list": [
            {
              "title": "基础护肤",
              "id": 421,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0403.png"
            },
            {
              "title": "卸妆洁面",
              "id": 422,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0404.png"
            },
            {
              "title": "护肤工具",
              "id": 423,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0405.png"
            }
          ]
        },
        {
          "name": "个人护理",
          "list": [
            {
              "title": "洗发护发",
              "id": 431,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0406.png"
            },
            {
              "title": "身体护理",
              "id": 432,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0407.png"
            },
          ]
        },
      ]
    },
    {
      "imgurl": 'http://pskxv51k0.bkt.clouddn.com/list05.jpg',
      "list": [
        {
          "name": "婴童精选",
          "list": [
            {
              "title": "618同价专区",
              "id": 511,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0501.png"
            },
            {
              "title": "蜜饯果干",
              "id": 512,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0502.png"
            },
            {
              "title": "坚果炒货",
              "id": 513,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0503.png"
            },
            {
              "title": "惊天动地",
              "id": 514,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/1013.png"
            }
          ]
        },
        {
          "name": "童装",
          "list": [
            {
              "title": "小时糖巧",
              "id": 521,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0504.png"
            },
            {
              "title": "饼干糕点",
              "id": 522,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0505.png"
            },
            {
              "title": "好味精选",
              "id": 523,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0506.png"
            }
          ]
        },
        {
          "name": "童鞋 ",
          "list": [
            {
              "title": "夏季推荐",
              "id": 531,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0507.png"
            },
            {
              "title": "新品首发",
              "id": 532,
              "imgurl": "http://pskxv51k0.bkt.clouddn.com/0508.png"
            }
          ]
        },
      ]
    },
  ];
  // void _onItemTapped(index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  //   print(_selectedIndex);
  // }

  rightListController(index) {
    return RightList(allData[index]["imgurl"], allData[index]["list"]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new SearchBar(), //container
        Expanded(
          child: StreamBuilder<Object>(
              stream: liseIndexService.stream$,
              builder: (context, snapshot) {
                if (snapshot.hasError) return Text('Error: ${snapshot.error}');
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Text('木有数据');
                  case ConnectionState.waiting:
                    return Text('获取数据中...');
                  case ConnectionState.active:
                    return Stack(
                      children: <Widget>[
                        //左边不动的
                        Positioned(
                          top: 0.0,
                          bottom: 0.0,
                          left: 0.0,
                          child: Container(
                            width: fullWidth(context) / 4.6,
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(color: Colors.black12))),
                            child: ListView.builder(
                              padding: const EdgeInsets.only(top: 5.0),
                              itemCount: itemList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.red,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 18.0, right: 2.0),
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 100),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                              color: index == snapshot.data
                                                  ? Color(0xFFab2b2b)
                                                  : Colors.transparent,
                                              width: 3.0),
                                        ),
                                      ),
                                      alignment: Alignment(-0.3, 0.0),
                                      // margin: EdgeInsets.all(10.0),
                                      child: Text(
                                        itemList[index],
                                        style: TextStyle(
                                            fontSize: fullWidth(context) / 27,
                                            color: index == snapshot.data
                                                ? Color(0xFFab2b2b)
                                                : Color(0xFF333333)),
                                      ),
                                    ),
                                  ),
                                  // onTap: () => _onItemTapped(index),
                                  onTap: () => liseIndexService
                                      .changeItemListIndex(index),
                                );
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0.0,
                          left: fullWidth(context) / 4.6,
                          top: 0.0,
                          bottom: 0.0,
                          child: Container(
                              child: RightList(allData[snapshot.data]["imgurl"],
                                  allData[snapshot.data]["list"])),
                        )
                      ],
                    );

                  case ConnectionState.done:
                    return Text('数据停止');
                }
                return null; // unreachable
              }),
        )
      ],
    );
  }
}

class RightList extends StatefulWidget {
  final String _imgurl;
  final List _list;

  const RightList(
    this._imgurl,
    this._list, {
    Key key,
  }) : super(key: key);

  @override
  _RightListState createState() => _RightListState();
}

class _RightListState extends State<RightList> {
  List<Widget> listControllers = List();
  List<Widget> listItemControllers = List();

  List<Widget> createListItem(List _d) {
    return _d
        .map(
          (item) => InkWell(
                child: Container(
                  width: fullWidth(context) / 4.2,
                  height: fullWidth(context) / 4.1,
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                            child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: item["imgurl"],
                        )),
                        Text(
                          item["title"],
                          style: TextStyle(fontSize: 11.0),
                        )
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AfterList(
                            'http://129.204.49.171:6006/#/list/' +
                            // 'http://192.168.0.100:8080/#/list/' +
                                item["id"].toString())),
                    // MaterialPageRoute(builder: (context) => SecondRoute()),
                  );
                },
              ),
        )
        .toList();
  }

  List<Widget> createList(List _l) {
    listControllers = [
      Padding(
        //title
        padding: const EdgeInsets.all(8.0),
        child: AspectRatio(
          //上面大图
          aspectRatio: 2.68,
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: widget._imgurl,
          ),
        ),
      ),
    ];
    for (var i = 0; i < _l.length; i++) {
      listControllers
        ..add(Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 5.0),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12))),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        widget._list[i]["name"], //_list[0]["name"]
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Wrap(
                children: createListItem(widget._list[i]["list"]),
              ),
            ],
          ),
        ));
    }
    print('createlist');
    return listControllers;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate((createList(widget._list))),
        )
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: fullWidth(context) / 4.5,
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(color: Colors.black26, width: 0.5))),
      child: SafeArea(
        minimum: EdgeInsets.zero,
        child: Row(
          children: <Widget>[
            SizedBox(width: 15.0),
            // 搜索
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFFededed),
                    borderRadius: BorderRadius.circular(8.0)),
                height: fullWidth(context) / 14,
                margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.search,
                      color: Colors.black38,
                    ),
                    Text(
                      ' 网易智造强劲交流风扇',
                      style: TextStyle(color: Colors.black38),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(width: 15.0),
          ],
        ),
      ),
    );
  }
}
